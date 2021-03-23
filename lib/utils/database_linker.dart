import 'dart:async';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ltcapp/utils/csv_utils.dart';
import 'package:csv/csv.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:io';
import 'package:ltcapp/utils/DateAndTimeGetter.dart';
import 'package:http/http.dart' as http;


class DatabaseHandler {
  // The pointer to the database itself
  var db;


  String dbPath;

  String dbName;
  String dbTableName;

  List fetchedData = [];

  DateAndTime dtGetter = DateAndTime();

  // Nehmind; Replace this with a Listener func in the LoginPageVM file!!!
  //  bool tempPassChecker = false;

  Future<void> setDBInitParams(String name, String tableName) async
  {
    dbName = name;
    dbTableName = tableName;
  }

  void fetchDatabaseFromServer(String url) async
  {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      fetchedData = json.decode(response.body);
      // TODO; Create auto data importer for db populating
    }
  }

  void setDatabasePath(String path) {
    dbPath = path;
  }

  Future<void> databaseCreationOptimizer() async
  {
    dbPath = await getDatabasesPath();
    dbPath = join(dbPath, dbName);

    bool result = await databaseExists(dbPath);
    var tempDB = await openDatabase(dbPath);
    int count = 0;
    try {
      count = Sqflite.firstIntValue(
          await tempDB.rawQuery('SELECT COUNT(*) FROM $dbTableName'));
    } catch (count) {
      deleteDatabase(dbPath);
    }
    if (count == 1) {
      print(count.toString());
      print("Less than or exactly 1 element detected. Resetting.");
      deleteDatabase(dbPath);
      result = false;
      return databaseCreationOptimizer();
    }
    else {
      // First time launch SOP
      switch (dbTableName) {
        case 'LtcPersonnelInfo':
          break;
        case 'LtcVehInfo':
          break;
        case 'LtcVehTripsInfo':
          try {
            final Future<Database> database = openDatabase(
              dbPath,
              onCreate: (dbref, version) {
                return dbref.execute(
                  "CREATE TABLE $dbTableName("
                  // Veh Trips Info Columns
                      ""
                      ")",
                );
              },
              version: 1,
            );

            if (db != null) {
              result = true;
            }

            db = database;
          } catch (result) {
            if (result == false) {
              return databaseCreationOptimizer();
            }
          }
          break;
      }
      if (count == 0) {
        buildBaseDBData();
      }
    }


    // Just to check if table exists
    callConversion();
  }

  Future<void> resetDB() async
  {
    await deleteDatabase(dbPath);
  }

  // Func to call once app opens
  void openTheDatabase(String path) async
  {
    db = await openDatabase(path);
  }

  // Redundant

  Future<void> insertNewData(var theData) async
  {
    // TODO: Already a legacy function. Not to be called.
    if (db == null) {
      return;
    }

    if (theData is FullDetailSet) {
      FullDetailSet fDS = theData;

      final Database database = await db;

      await database.insert(dbTableName, fDS.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    else if (theData is FullVehicleDetailSet) {
      FullVehicleDetailSet fVDS = theData;

      final Database database = await db;

      await database.insert(dbTableName, fVDS.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }


    callConversion();
  }

  Future<bool> ifDataRowExists(String key) async
  {
    final Database database = await db;

    try {
      var result = await database.rawQuery(""
          "SELECT COUNT (1)"
          "FROM $dbTableName"
          "WHERE $key = value;"
          "");

      if (result != null) {

      }
      else {
        print("Error: Row does not exist");
        return false;
      }
    }
    catch (_) {

    }

    return false;
  }

  Future<List<Map>> getRowFromColumnData(String columnName, String columnKey) async
  {
    final Database database = await db;

    try {
      var result = await database.rawQuery(""
          "SELECT * "
          "FROM $dbTableName "
          "WHERE $columnName=? "
          "", [columnKey]);
      return result;
    }
    catch (_) {

    }

    return null;
  }

  Future<List<Map>> getColumnInRowData(String column) async
  {
    final Database database = await db;

    try {
      var result = await database.rawQuery(""
          ""
          "");
    }
    catch (_)
    {

    }
    return null;
  }


  Future<void> callConversion() async
  {
//    dbPath = await getDatabasesPath();
//   tempPath = join(dbPath, dbName);

    bool result = await databaseExists(dbPath);
    if (result == true) {
      // Send database data into a string
      // Doesn't work right now due to null db data
      var dbToConvert = await db;
      var dbConversionUnit = await dbToConvert.query(dbTableName);
      print((Sqflite.firstIntValue(
          await dbToConvert.rawQuery('SELECT COUNT(*) FROM $dbTableName')))
          .toString() + ' Rows');
      // TODO; Fix character limit to properly print out
      //    String printo = mapListToCsv(dbConversionUnit);
      //       print(printo);
      // Create file to send db data into
      //     File file = await new File(dbPath + '/$dbTableName.csv');
      //     file.create(recursive: true);
      //     file.writeAsString(printo);
      // Spit the data written into file out into console
      //     var read = new File(dbPath + '/$dbTableName.csv').readAsString();
      //     String content = await read;
      //     print(content);

    }
  }

  Future<List<Map>> getTableAsWhole() async
  {
    if (db == null) {
      return null;
    }

    try {
      var cachedDB = await db;
      List<Map> cachedDBPointer = await cachedDB.query(dbTableName);
      return cachedDBPointer;
    }
    catch (_) {
      return null;
    }
  }



  void buildBaseDBData()
  {
    /*   switch (dbTableName)
    {
      case 'LtcPersonnelInfo':
        var fDS = new FullDetailSet();
        fDS.sortPersonalData('Test Man', '281A', '5 Cresent Ave', '84569018', '67889231', dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), 'A2', ReligionType.Christianity.toString(), RaceType.Chinese.toString(), BloodType.AB_PLUS.toString(), 'None', 'None', 'Testing Man', '97810781', '5 Cresent Ave', VocationType.TO.toString(), 'Stay In', 'None');
        fDS.sortTrainingData('Basic Transport', '290121-210221', 1, 'MID46112', VehLicenseType.class3.toString(), dtGetter.Date(DateTime.now()));
        fDS.sortEducationData('Junior College', 'Pure Sciences', 'Soccer Club', 'K.Ickers');
        fDS.sortMiscData('Drinking; Driving; Drink Driving', VehLicenseType.class2.toString(), 'M2811345', dtGetter.Date(DateTime.now()), TrueOrFalseType.True.toString(), TrueOrFalseType.True.toString(), 'FAG69781023', ClothesSizeType.M.toString(), 70, 100, 9);
        fDS.loginCredentials = new LoginCredential(username: "test@email.com", password: "123");
   //     insertNewData(fDS);
        break;
      case 'LtcVehInfo':
        var fVDS = new FullVehicleDetailSet();
        fVDS.sortData('MID50', VehType.AType.toString(), VehClassType.Class3.toString(), '696969');
        insertNewData(fVDS);
        break;
      case 'LtcVehTripsInfo':
        break;
    }*/
  }

  DatabaseHandler({this.dbName, this.dbTableName});
}