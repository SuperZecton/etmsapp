
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class OffPassViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _OffPassDelayedFuture = "strength";
  List<List<String>> get fetchedOffPass => dataMap![_OffPassDelayedFuture];
  bool get fetchingOffPass => busy(_OffPassDelayedFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _OffPassDelayedFuture: getOffPassList,
  };

  Future<List<List<String>>> getOffPassList() async {
    List<List<String>> _rawList = await db.getParadeState();
    List<List<String>> _newList = [];
    for(int i=0; i< _rawList.length; i++){
      String _localUser = _rawList[i][0];
      String _status = _rawList[i][2];
      if (_status == "OFF"){
        String rank = await db.singleDataPull("Users", "username", _localUser, "rank");
        String fullName = await db.singleDataPull("Users", "username", _localUser, "fullName");
        String appendedName = rank + " " + fullName;
        _rawList[i].add(appendedName);
        _newList.add(_rawList[i]);
        print(_newList);
      }
    }
    print("List of parade state is $_newList");
    return _newList;

  }

}