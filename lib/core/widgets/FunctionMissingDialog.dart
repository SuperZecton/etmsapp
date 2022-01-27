
import 'package:flutter/material.dart';

class FunctionMissingDialog {
  static void functionMissingDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Function Not Available Yet"),
        );
      },
    );
  }
}