import 'package:flutter/material.dart';
import 'package:ltcapp/features/login/view/widgets/LoadingIndicator.dart';

class LoginPageViewModel extends ChangeNotifier {
  String get email => emailController.text;
  String get password => passwordController.text;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void authenticateUserCredentials() {
    bool canLogin;
  }

  void _onLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [LoadingIndicator(), Text("Loading..")],
            ),
          );
        });
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
