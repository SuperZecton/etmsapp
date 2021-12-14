import 'dart:async';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

class CurrentUser {
  /// The purpose of this class is to have a global storage that can be pulled from anywhere
  /// For example, to get username, just use CurrentUser.instance.username
  String username;
  String password;
  static final CurrentUser _currentUser = CurrentUser._internal();
  CurrentUser._internal();
  factory CurrentUser() => _currentUser;
  static CurrentUser get instance => _currentUser;


}
