import 'package:flutter/material.dart';
import 'package:ltcapp/features/login/viewmodel/LoginPageVM.dart';
import 'package:ltcapp/features/login/viewmodel/authentication.dart';
import 'package:ltcapp/features/registration/view/pages/SignupPage.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/widgets/widgets.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginPageViewModel>(context, listen: false);
    bool loginCheck = false;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 50),
                    Column(
                      children: <Widget>[
                        _emailEntryField(),
                        _passwordEntryField(),
                      ],
                    ),
                    SizedBox(height: 20),
                    _submitButton(loginCheck),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                    _divider(),
                    _singPassButton(),
                    SizedBox(height: height * .055),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 40,
                left: 0,
                child: TopBackButton(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ))),
          ],
        ),
      ),
    );
  }

  Widget _emailEntryField() {
    return Consumer<LoginPageViewModel>(
      builder: (context, vm, child) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                obscureText: false,
                controller: vm.emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    fillColor: secondaryColor,
                    filled: true),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _passwordEntryField() {
    return Consumer<LoginPageViewModel>(
      builder: (context, vm, child) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                obscureText: true,
                controller: vm.passwordController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    fillColor: secondaryColor,
                    filled: true),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _submitButton(bool loginCreds) {
    final auth = Provider.of<Authentication>(context, listen: false);
    final vm = Provider.of<LoginPageViewModel>(context, listen: false);
    return InkWell(
        onTap: () {

          /*// TODO: Implement better ChangeNotifier for vm so vm does not need to be redefined in this widget
          auth.email = vm.emailController.text;
          auth.password = vm.passwordController.text;
          auth.verifyLoginData(context, loginCreds);*/
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Function Not Available Yet.\n\nPlease click below to enter the TMS Application."),
                );
              });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
/*
            color: Colors.blue,
*/
            color: Color(0xff808080),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _singPassButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
/*
                color: Color(0xff808080),
*/
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.accessibility_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/home'),
              child: Container(
                decoration: BoxDecoration(
/*
                  color: Color(0xffA9A9A9),
*/
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Enter TMS Application',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
/*
        Navigator.pushNamed(context, '/signup');
*/
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Function Not Available Yet"),
              );
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
              'Don\'t have an account ?',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Login',
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
