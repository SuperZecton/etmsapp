import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ltcapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/globals.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();


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
                        child: _textField("Full Name", Icons.perm_identity_rounded),
                      ),
                      Expanded(
                        child: _textField(
                          "NRIC",
                          Icons.assessment,
                          helperText: "Last 4 characters only",
                          maxLength: 4,
                        ),
                      ),
                    ],
                  ),
                  _textField("Email Address", Icons.alternate_email),
                  _textField("Address", Icons.home),
                  _textField("Contact No.", Icons.phone_android),
                  _textField("Home No.", Icons.phone),
                  _dateField("Date of Birth", Icons.date_range),
                  _dateField("Date of Enlistment", Icons.calendar_today_rounded),
                  _dateField("Date of ORD.", Icons.calendar_today_outlined),

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
        backgroundImage: AssetImage('images/ltclogo.jpg'),
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
                color: Colors.black,
                size: 30,
              ),
            ),
            Text('Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _textField(String mainText, IconData _icon,
      {bool isPassword = false, String helperText = "", int maxLength }) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: isPassword,
        cursorColor: Colors.grey,
        maxLength: maxLength,
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
          helperStyle: TextStyle(
            color: Colors.white,
          ),
          helperText: helperText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _dateField( String mainText, IconData _icon,) {
    String formattedDate = DateFormat('DD-MM-yyyy').format(selectedDate);
    TextEditingController _controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controller,
        onTap: () => _selectDate(context),
        readOnly: true,
        cursorColor: Colors.grey,
        initialValue: formattedDate,
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
            //TODO Redirect to next page
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
            'Registration',
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

 Future <void> _selectDate(BuildContext context) async {
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
  }


}
