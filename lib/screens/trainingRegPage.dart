import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/widgets/RegistrationFields/dateTextField.dart';
import 'package:ltcapp/widgets/RegistrationFields/registrationTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/widgets/RegistrationFields/vocationDropDownField.dart';
import 'package:ltcapp/utils/extensions.dart';
class TrainingRegistrationPage extends StatefulWidget {
  TrainingRegistrationPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TrainingRegistrationPageState createState() =>
      _TrainingRegistrationPageState();
}

class _TrainingRegistrationPageState extends State<TrainingRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _trgFrameController = TextEditingController();
  final _trgPeriodController = TextEditingController();
  final _noAttemptsController = TextEditingController();
  final _militaryLicenseController = TextEditingController();
  final _militaryLicenseTypeController = TextEditingController();
  final _doiController = TextEditingController();

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
                        child: RegistrationTextField(
                          "Training Frame",
                          Icons.perm_identity_rounded,
                          _trgFrameController,
                          validationAction: (String input) => input.isValidFrame() ? null: "Example: 359A",
                          maxLength: 4,
                        ),
                      ),
                      Expanded(
                        child: DateTextField(
                          "Training Period",
                          Icons.calendar_today_sharp,
                          _trgPeriodController,
                        ),
                      ),
                    ],
                  ),
                  RegistrationTextField("No. of attempts", Icons.format_list_numbered_sharp, _noAttemptsController, validationAction: (String input) => input.isValidAttempt() ? null: "Numbers only"),
                  RegistrationTextField("Military License", FontAwesomeIcons.idCard, _militaryLicenseController),
                  RegistrationTextField("Military License Type", FontAwesomeIcons.addressCard, _militaryLicenseTypeController),
                  DateTextField("Date of Issue", Icons.calendar_today_outlined, _doiController),


          
    
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
        text: 'Training Info',
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ))
          ],
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
            Navigator.pushNamed(context, '/edureg');
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
}
