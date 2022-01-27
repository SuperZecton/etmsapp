import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/services/Permissions.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageViewModel.dart';
import 'package:ltcapp/features/login/viewmodel/WelcomePageViewModel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import '../../../registration/model/individual_identity.dart';
import 'package:ltcapp/main.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final double _imageHeight = 256.0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageViewModel>.reactive(
      viewModelBuilder: () => WelcomePageViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: primaryColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  _firstTitle(context),
                  SizedBox(
                    height: 10,
                  ),
                  _secondTitle(context),
                  SizedBox(
                    height: 20,
                  ),
                  _label(),
                  _loginButton(context),
                  SizedBox(
                    height: 20,
                  ),
                  _signUpButton(context),
                  SizedBox(
                    height: 30,
                  ),
                  _declarationText(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/login'),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blue),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  /*Widget _debugButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Function Not Available Yet"),
                );
              });
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Debugging Button',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  } */

  Widget _signUpButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/signup'),
      /*showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Function Not Available Yet"),
                );
              });*/

      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Registration',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _firstTitle(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'ETMS',
        style: GoogleFonts.josefinSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _secondTitle(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Welcome to Light Transport Company',
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
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

/*  Unused Widget
 Widget _buildImage() {
    return Positioned(
      top: 0.0,
      left: 0.0,

      child: new ClipPath(
        clipper: new DiagonalClipper(),
        child: new Image.asset(
          'images/frontimage.jpg',
          fit: BoxFit.fill,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          //color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }
*/
  Widget _declarationText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.check_box,
            color: Colors.white,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text:
                    'I do hereby declare that all the information given above is true to the best of my knowledge and belief.',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Mission First, Safe Always',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            /*Text(
              'Stuff here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),*/
          ],
        ));
  }
}
