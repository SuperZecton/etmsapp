import 'package:flutter/material.dart';
import 'package:ltcapp/main.dart';
class LoginPage extends StatefulWidget {

  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('images/compass.png'),

                SizedBox(height: 20),
                Text('Welcome to LTC',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Roboto",


                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text('Next'),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/main');
                    });

                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
