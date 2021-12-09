import 'dart:async';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class LoginCredential {
  String username = "default";
  String password = "default";

  LoginCredential({ @required this.username, @required this.password});
}