import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:ltcapp/widgets/RegistrationFields/bloodTypeDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/pesDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/raceDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/religionDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/stayInStayOutDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/vocationDropDownField.dart';
import 'package:ltcapp/widgets/RegistrationFields/registrationTextField.dart';
import 'package:ltcapp/widgets/RegistrationFields/dateTextField.dart';
import 'package:ltcapp/widgets/circularLogo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/utils/extensions.dart';
import 'package:ltcapp/widgets/topBackButton.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nricController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _homeNumberController = TextEditingController();

  final _drugAllergyController = TextEditingController();
  final _foodAllergyController = TextEditingController();
  final _nokController = TextEditingController();
  final _nokAddressController = TextEditingController();
  final _nokNumberController = TextEditingController();

  final _medicalConditionController = TextEditingController();
  final _doeController = TextEditingController();
  final _dobController = TextEditingController();
  final _ordController = TextEditingController();
  final _dopiController = TextEditingController();

  String _pesValue = PESDropDownField().getValue();
  String _raceValue = RaceDropDownField().getValue();
  String _religionValue = ReligionDropDownField().getValue();
  String _bloodTypeValue = BloodTypeDropDownField().getValue();
  String _stayInStayOutValue = StayInStayOutDropDownField().getValue();
  String _vocationValue = VocationDropDownField().getValue();

  final FullDetailSet fdSet = new FullDetailSet();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          color: primaryColor,
        ),
        child: Stack(
          children: <Widget>[
            /*Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),*/ //TODO: Make this nicer

            Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  CircularLogo(),
                  SizedBox(
                    height: 30,
                  ),
                  _title(),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RegistrationTextField(
                          "Full Name",
                          Icons.perm_identity_rounded,
                          _nameController,
                          validationAction: (String input) => input
                                  .isValidName()
                              ? null
                              : "Name cannot have numbers or special characters",
                        ),
                      ),
                      Expanded(
                        child: RegistrationTextField(
                          "NRIC",
                          Icons.assessment,
                          _nricController,
                          helperText: "Last 4 characters only",
                          validationAction: (String input) =>
                              input.isValidNRIC()
                                  ? null
                                  : "Enter last 4 characters only",
                          maxLength: 4,
                        ),
                      ),
                    ],
                  ),
                  RegistrationTextField(
                    "Email Address",
                    Icons.alternate_email,
                    _emailController,
                    validationAction: (String input) =>
                        input.isValidEmail() ? null : "Enter valid email",
                  ),
                  RegistrationTextField(
                    "Password",
                    FontAwesomeIcons.key,
                    _passwordController,
                    isPassword: true,
                  ),
                  RegistrationTextField(
                      "Address", Icons.home, _addressController,
                      helperText: "Blk No, Street, Floor, Postal Code"),
                  RegistrationTextField(
                    "Contact No.",
                    Icons.phone_android,
                    _numberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  RegistrationTextField(
                    "Home No.",
                    Icons.phone,
                    _homeNumberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  DateTextField("Date of Birth", FontAwesomeIcons.calendar,
                      _dobController),
                  DateTextField("Date of Enlistment",
                      FontAwesomeIcons.calendarAlt, _doeController),
                  DateTextField(
                      "ORD Date", Icons.calendar_today, _ordController),
                  DateTextField("Date of posted in", Icons.calendar_today,
                      _dopiController),
                  PESDropDownField(),
                  RaceDropDownField(),
                  ReligionDropDownField(),
                  BloodTypeDropDownField(),
                  RegistrationTextField("Drug Allergy",
                      FontAwesomeIcons.tablets, _drugAllergyController),
                  RegistrationTextField("Food Allergy",
                      FontAwesomeIcons.hamburger, _foodAllergyController),
                  RegistrationTextField(
                    "Next of Kin",
                    FontAwesomeIcons.userFriends,
                    _nokController,
                    validationAction: (String input) => input.isValidName()
                        ? null
                        : "Name cannot have numbers or special characters",
                  ),
                  RegistrationTextField(
                    "Next of Kin Address",
                    FontAwesomeIcons.addressBook,
                    _nokAddressController,
                    helperText: "Blk No, Street, Floor, Postal Code",
                  ),
                  RegistrationTextField(
                    "Next of Kin Number",
                    FontAwesomeIcons.phone,
                    _nokNumberController,
                    validationAction: (String input) =>
                        input.isValidPhoneNumber()
                            ? null
                            : "Enter a valid number",
                  ),
                  VocationDropDownField(),
                  StayInStayOutDropDownField(),
                  RegistrationTextField(
                      "Medical Condition",
                      FontAwesomeIcons.hospitalUser,
                      _medicalConditionController),
                  SizedBox(
                    height: 20,
                  ),
                  _submitButton(),
                  SizedBox(height: height * .14),
                ],
              ),
            ),
            Positioned(top: 40, left: 0, child: TopBackButton()),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'LTC Registration',
        style: GoogleFonts.openSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: () {
          setState(() {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              fdSet.sortPersonalData(
                _nameController.text,
                _nricController.text,
                _addressController.text,
                _numberController.text,
                _homeNumberController.text,
                _dobController.text,
                _doeController.text,
                _ordController.text,
                _dopiController.text,
                _pesValue,
                _religionValue,
                _raceValue,
                _bloodTypeValue,
                _drugAllergyController.text,
                _foodAllergyController.text,
                _nokController.text,
                _nokNumberController.text,
                _nokAddressController.text,
                _vocationValue,
                _stayInStayOutValue,
                _medicalConditionController.text,
              );
              Navigator.pushNamed(context, '/trgreg');
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Please fill out all the required fields'),

                          ],
                        ),
                      ),
                    );
                  });
            }
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blue,
          ),
          child: Text(
            'Next page',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  /// Will delete all this stuff soon, just using it for debugging
  /*

  Widget _debugButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical:40),
      child: InkWell(
        onTap: () {
          setState(() {
            print(_doeController.text);
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blue,
          ),
          child: Text(
            'Debugging Button',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }


   */

  /* Will try to slot this in somewhere in the future
  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, '/login');
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
*/

}
