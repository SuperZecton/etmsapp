import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';

class HomePageModel {
  final currentUsername = CurrentUser.instance.username;
  DatabaseHandler db = DatabaseHandler();

  Future<String> getFullNameFromDB() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
      return await db.singleDataPull("Users", "username", _username, "fullName");
    } else {
      print("Username from DB is empty when searching");
      _username = "";
      return Future.error("No Name found");
    }
  }

  String _fullName = "";
  String get fullName => _fullName;


}
