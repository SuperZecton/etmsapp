import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:ltcapp/widgets/RegistrationFields/registrationTextField.dart';
import 'package:ltcapp/widgets/circularLogo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/widgets/topBackButton.dart';

class EducationRegistrationPage extends StatefulWidget {
  EducationRegistrationPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _EducationRegistrationPageState createState() => _EducationRegistrationPageState();
}

class _EducationRegistrationPageState extends State<EducationRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final _educationLevelController = TextEditingController();
  final _streamCourseController = TextEditingController();
  final _ccaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
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
                  RegistrationTextField("Education Level",FontAwesomeIcons.school , _educationLevelController),
                  RegistrationTextField("Stream/Course",FontAwesomeIcons.bookOpen , _streamCourseController),
                  RegistrationTextField("CCA",FontAwesomeIcons.quidditch , _ccaController),






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
        text: 'Education Info',
        style: GoogleFonts.openSans(
          textStyle: Theme
              .of(context)
              .textTheme
              .headline4,
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
            Navigator.pushNamed(context, '/othrreg');
          });
        },
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.5,
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