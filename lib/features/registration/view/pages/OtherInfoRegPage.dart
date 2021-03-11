import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/features/registration/view/widgets/widgets.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../login/view/pages/WelcomePage.dart';
import '../../../../main.dart';


class OtherInfoRegistrationPage extends StatefulWidget {
  OtherInfoRegistrationPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _OtherInfoRegistrationPageState createState() =>
      _OtherInfoRegistrationPageState();
}

class _OtherInfoRegistrationPageState extends State<OtherInfoRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final _hobbiesController = TextEditingController();
  final _civilianLicenseController = TextEditingController();
  final _civilianLicenseNoController = TextEditingController();
  final _civilianLicenseDOIController = TextEditingController();
  final _personalVehicleController = TextEditingController();

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
                  RegistrationTextField("Hobbies", FontAwesomeIcons.paintBrush,
                      _hobbiesController),
                  RegistrationTextField("Civilian License",
                      FontAwesomeIcons.idCardAlt, _civilianLicenseController),
                  RegistrationTextField("License No.",
                      FontAwesomeIcons.idCard, _civilianLicenseNoController),
                  DateTextField(
                      "License Date of Issue",
                      FontAwesomeIcons.calendarAlt,
                      _civilianLicenseDOIController),
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
        text: 'Other Info',
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
            fDSTemp.sortMiscData(
            _hobbiesController.text,
            _civilianLicenseController.text,
            _civilianLicenseNoController.text,
            _civilianLicenseDOIController.text,
            "No",
            _personalVehicleController.text,
            "Unknown",
            "M",
            50,
            50,
            9);

            personnelDBHandle.insertNewData(fDSTemp);

            Navigator.pushNamed(context, '/');
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
