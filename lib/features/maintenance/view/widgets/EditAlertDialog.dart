
import 'package:flutter/material.dart';

class EditAlertDialog {
  void showEditAlertDialog(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final emailField = TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'something@example.com',
            labelText: 'Account Email to Reset',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        );

        return CustomAlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 4,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                emailField,
                MaterialButton(
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/12,
                    padding: EdgeInsets.all(15.0),
                    child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Reset',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}