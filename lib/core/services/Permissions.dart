import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';

class Permissions {
  DatabaseHandler db = DatabaseHandler();

  Future<String?> getPermissionLevel(String usernameValue) async {
    var permissionLevel;
    permissionLevel = await db.singleDataPull("Users", "username", usernameValue, "permissionLevel");
    return permissionLevel;
  }

}
