import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginCredential {
  final String username;
  final String password;

  LoginCredential({this.username, this.password});
}