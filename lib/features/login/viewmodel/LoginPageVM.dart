

import 'package:flutter/cupertino.dart';

class LoginPageViewModel extends ChangeNotifier{
  String get email => emailController.text;
  String get password => passwordController.text;


/* Future<void> fetchUserCredentials() async{
  final userCredentials = await ...

  notifyListeners();

} */

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void authenticateUserCredentials() {
    bool canLogin;

  }
@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }

}

