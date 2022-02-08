import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';

class Permissions {
  DatabaseHandler newDatabase = DatabaseHandler();

  getPermissionLevel(String usernameValue) {
    var permissionLevel;
    //permissionLevel = newDatabase.singleDataPull("Users", "username", usernameValue, "permissionLevel");
    return permissionLevel;
  }
}
