import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
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
    for (int i = 0; i < _rawList.length; i++) {
      String _localUser = _rawList[i][0];
      String _status = _rawList[i][2];
      if (_status == "OFF") {
        String rank =
            await db.singleDataPull("Users", "username", _localUser, "rank");
        String fullName = await db.singleDataPull(
            "Users", "username", _localUser, "fullName");
        String appendedName = rank + " " + fullName;
        _rawList[i].add(appendedName);
        _newList.add(_rawList[i]);
        print(_newList);
      }
    }
    print("List of parade state is $_newList");
    return _newList;
  }

  void onTap(BuildContext context, String username) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          contentPadding: EdgeInsets.all(10.0),
          title: Text(
            "Sign Off Pass",
            style: GoogleFonts.roboto(
              color: darkTextColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.all(2.0),
            child: Text(
              "This is to confirm that you're signing the off pass for user $username",
              style: GoogleFonts.roboto(
                color: darkTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Sign",
                style: GoogleFonts.roboto(
                  color: Colors.blueAccent,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                db.signOffPass(username);
                print("Off pass signed");
              }
            ),
            TextButton(
              child: Text(
                "Cancel",
                style: GoogleFonts.roboto(
                  color: Colors.blueAccent,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
