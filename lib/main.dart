import 'package:flutter/material.dart';
import 'package:ltcapp/screens/loginPage.dart';
import 'package:ltcapp/screens/signupPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/utils/diagonal_clipper.dart';
import 'package:ltcapp/screens/homePage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/utils/database_linker.dart';

//void main() => runApp(MyApp());

DatabaseHandler mainHandle = new DatabaseHandler(dbName: "main_personnel.db");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainHandle.databaseCreation_Optimizer();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LTC App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final double _imageHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffed1f0c), Color(0xffff0a43)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLogo(),
              SizedBox(
                height:20,
              ),
              _firstTitle(),
              SizedBox(
                height:10,
              ),
              _secondTitle(),
              SizedBox(
                height:20,
              ),
              _label(),

              _loginButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, '/login');
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),

           child:Text(
              'Login',
             style: TextStyle(fontSize:20, color: Color(0xfff7892b)),

      ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, '/signup');
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
          'Registration',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }



  Widget _firstTitle(){
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
  Widget _secondTitle() {
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



  Widget _buildLogo(){
    return CircleAvatar(
      radius: 105,
      backgroundColor: Color(0xffC0C0C0),
        child: CircleAvatar(
        radius: 100,
          backgroundImage: AssetImage('images/ltclogo.jpg'),
    ),

    );


  }
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
