import 'dart:async';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginCredential {
  final String username;
  final String password;

  LoginCredential({ @required this.username, @required this.password});
}