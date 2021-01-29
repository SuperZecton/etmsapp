import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/widgets/dropDownTextField.dart';
import 'package:ltcapp/widgets/registrationTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/main.dart';
import 'package:ltcapp/utils/individual_identity.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final _nameController = TextEditingController();
  final _nricController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _homeNumberController = TextEditingController();

  final _pesController = TextEditingController();
  final _raceController = TextEditingController();
  final _religionController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _drugAllergyController = TextEditingController();
  final _foodAllergyController = TextEditingController();
  final _nokController = TextEditingController();
  final _nokAddressController = TextEditingController();
  final _nokNumberController = TextEditingController();

  final _vocationController = TextEditingController();
  final _stayInOutController = TextEditingController();

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
                  _buildLogo(),
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
                        child: RegistrationTextField("Full Name",
                            Icons.perm_identity_rounded, _nameController),
                      ),
                      Expanded(
                        child: RegistrationTextField(
                          "NRIC",
                          Icons.assessment,
                          _nricController,
                          helperText: "Last 4 characters only",
                          maxLength: 4,
                        ),
                      ),
                    ],
                  ),
                  RegistrationTextField("Email Address", Icons.alternate_email, _emailController),
                  RegistrationTextField("Address", Icons.home, _addressController),
                  RegistrationTextField("Contact No.", Icons.phone_android, _numberController),
                  RegistrationTextField("Home No.", Icons.phone, _homeNumberController),
                  RegistrationDropDownField(Icons.fitness_center,"PES"),
                  RegistrationTextField("Race", Icons.recent_actors, _raceController),
                  RegistrationTextField("Religion", FontAwesomeIcons.cross, _religionController),
                  RegistrationTextField("Blood group", Icons.local_hospital, _bloodGroupController),
                  RegistrationTextField("Drug Allergy", FontAwesomeIcons.tablets, _drugAllergyController),
                  RegistrationTextField("Food Allergy", FontAwesomeIcons.hamburger, _foodAllergyController),
                  RegistrationTextField("Next of Kin",FontAwesomeIcons.userFriends, _nokController),
                  RegistrationTextField("Vocation", FontAwesomeIcons.briefcase, _nokAddressController),
                  RegistrationTextField("Stay-In/Stay-Out", FontAwesomeIcons.houseUser, _nokNumberController),

                  SizedBox(
                    height: 20,
                  ),
                  _submitButton(),
                  SizedBox(height: height * .14),
                ],
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
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

  Widget _buildLogo() {
    return CircleAvatar(
      radius: 105,
      backgroundColor: Color(0xffC0C0C0),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('images/ltcbluelogo2.jpg'),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text('Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white,))
          ],
        ),
      ),
    );
  }


  /*Widget _DOBdateField( String mainText, IconData _icon,) {
    String formattedDate = DateFormat('DD-MM-yyyy').format(selectedDate);
    TextEditingController _controller = TextEditingController(text: formattedDate);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controller,

        onTap: () => _selectDate(context),
        readOnly: true,
        cursorColor: Colors.grey,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          prefixIcon: Icon(
            _icon,
            color: Colors.white,
          ),
          labelText: mainText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }


  Widget _DOEdateField( String mainText, IconData _icon,) {
    String formattedDate = DateFormat('DD-MM-yyyy').format(selectedDate);
    TextEditingController _controller = TextEditingController(text: formattedDate);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controller,
        onTap: () => _selectDate(context),
        readOnly: true,
        cursorColor: Colors.grey,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          prefixIcon: Icon(
            _icon,
            color: Colors.white,
          ),
          labelText: mainText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }


  Widget _ORDdateField( String mainText, IconData _icon,) {
    String formattedDate = DateFormat('DD-MM-yyyy').format(selectedDate);
    TextEditingController _controller = TextEditingController(text: formattedDate);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controller,
        onTap: () => _selectDate(context),
        readOnly: true,
        cursorColor: Colors.grey,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xffffffff),
        ),
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          prefixIcon: Icon(
            _icon,
            color: Colors.white,
          ),
          labelText: mainText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }*/

  Widget _dropdownField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: Colors.cyan,
        initialValue: 'Input text',
        maxLength: 20,
        obscureText: isPassword,
        decoration: InputDecoration(
          icon: Icon(Icons.favorite),
          labelText: 'Label text',
          labelStyle: TextStyle(
            color: Color(0xFF6200EE),
          ),
          helperText: 'Helper text',
          suffixIcon: Icon(
            Icons.check_circle,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6200EE)),
          ),
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
    //        fdSet.sortPersonalData(_nameController.text, _nricController.text, _addressController.text, _numberController.text, _homeNumberController.text, dob, doe, ord, _pesController.text, _religionController.text, _raceController.text, _bloodGroupController.text, _drugAllergyController.text, _foodAllergyController.text, _nokController.text, _nokAddressController.text, _nokNumberController.text, _vocationController.text, _stayInOutController.text, '');
            Navigator.pushNamed(context, '/trgreg');


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

  /*Future <void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }*/

}
