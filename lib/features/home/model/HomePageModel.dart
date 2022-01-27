import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';

class HomePageModel {
  HomePageModel() {
    getFullNameFromDB().then((val) {
      _fullName = val;
    });
    print("fullname is " + _fullName);
  }
  final currentUsername = CurrentUser.instance.username;
  DatabaseHandler db = DatabaseHandler();

  Future<String> getFullNameFromDB() async {
    String _username;
    if (currentUsername != null) {
      _username = currentUsername as String;
    } else {
      print("Username from DB is empty when searching");
      _username = "";
    }
    String val =
        await db.singleDataPull("Users", "username", _username, "fullName");
    return val;
  }

  String _fullName = "";
  String get fullName => _fullName;


}
