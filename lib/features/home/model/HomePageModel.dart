import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/newdbutils/database_connector.dart';
import 'package:ltcapp/features/login/model/CurrentSession.dart';

class HomePageModel {
  final currentUsername = CurrentUser.instance.username;
  DatabaseHandler db = DatabaseHandler();
  Future<String> getFullNameFromDB() async {
    String val = await db.singleDataPull(
        "Users", "username", currentUsername, "fullName");
    if (val != null) {
      return val;
    } else {
      return "Error Getting Data";
    }
  }
  String nameName;
  String getName(){
    return nameName;
  }
  /// Error line during this function
  /*String getFullName() {
    String fullName;
    getFullNameFromDB().then((val) {
      fullName = val;
    });
    print(fullName);

    return fullName;
  }*/
  HomePageModel(){
    getFullNameFromDB().then((val){
      nameName = val;
    });
    print("NameName debug");
    print(nameName);


  }

}
