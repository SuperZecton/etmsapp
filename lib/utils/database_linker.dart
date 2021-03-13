import 'dart:async';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'csv_utils.dart';
import 'package:csv/csv.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'individual_identity.dart';
import 'individual_vehicle.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:io';
import 'DateAndTimeGetter.dart';
import 'package:http/http.dart' as http;


class DatabaseHandler {
  // The pointer to the database itself
  var db;


  String dbPath;
  String tempPath;

  String dbName;
  String dbTableName;

  List fetchedData = [];

  DateAndTime dtGetter = DateAndTime();

  void fetchDatabaseFromServer(String url) async
  {

    final response = await http.get(url);

    if (response.statusCode == 200)
    {
      fetchedData = json.decode(response.body);
      // TODO; Created auto data importer for db populating
    }
  }

  void setDatabasePath(String path)
  {
    tempPath = path;
  }

  void databaseCreation_Optimizer() async
  {
    dbPath = await getDatabasesPath();
    tempPath = join(dbPath, dbName);

    bool result = await databaseExists(tempPath);
    var tempDB = await openDatabase(tempPath);
    int count = 0;
    try {
      count = Sqflite.firstIntValue(
          await tempDB.rawQuery('SELECT COUNT(*) FROM $dbTableName'));
    }catch(count)
  {
    deleteDatabase(tempPath);
  }
    if (count == 1)
    {
      print(count.toString());
      print("Less than or exactly 1 element detected. Resetting.");
      deleteDatabase(tempPath);
      result = false;
      return databaseCreation_Optimizer();
    }
    else
      {
      // First time launch SOP
      switch (dbTableName) {
        case 'LtcPersonnelInfo':
          try {
            final Future<Database> database = openDatabase(
              tempPath,
              onCreate: (dbref, version) {
                return dbref.execute(
                  // The pain
                  "CREATE TABLE $dbTableName("
                  // Section 1: Personal Particulars
                      "fullName TEXT PRIMARY KEY, "
                      "nricLast4Digits TEXT, "
                      "fullHomeAddress TEXT, "
                      "handphoneNumber TEXT, "
                      "homephoneNumber TEXT, "
                      "dateOfBirth TEXT, "
                      "dateOfEnlistment TEXT, "
                      "dateOfORD TEXT, "
                      "dateOfPostIn TEXT, "
                      "pesType TEXT, "
                      "religion TEXT, "
                      "race TEXT, "
                      "bloodGroup TEXT, "
                      "drugAllergy TEXT, "
                      "foodAllergy TEXT, "
                      "NOKDetailfullName TEXT, "
                      "NOKDetailcontactNumber TEXT, "
                      "NOKDetailfullAddress TEXT, "
                      "vocationType TEXT, "
                      "stayInstayOut TEXT, "
                      "medicalConditions TEXT, "
                  // Section 2: Training Information
                      "trainingFrame TEXT, "
                      "trainingPeriod TEXT, "
                      "passAttempts INTEGER, "
                      "militaryLicenseNo TEXT, "
                      "militaryLicenseType TEXT, "
                      "milLicenseDateOfIssue TEXT, "
                  // Section 3: Education
                      "educationLevel TEXT, "
                      "streamcourseName TEXT, "
                      "ccaOptional TEXT, "
                      "schName TEXT, "
                  // Section 4: Other Information
                      "hobbiesInterest TEXT, "
                      "civillianLicenseType TEXT, "
                      "civillianLicenseNumber TEXT, "
                      "civillianLicenseDateOfIssue TEXT, "
                      "hasDoneDefensiveCourse TEXT, "
                      "hasPersonalVehicle TEXT, "
                      "personalVehiclePlateNumber TEXT, "
                      "tShirtSize TEXT, "
                      "no3sizeUpperTorso INTEGER, "
                      "no3sizeWaist INTEGER, "
                      "no3sizeShoes INTEGER, "
                  // Section 5: Login Information
                      "email TEXT, "
                      "password TEXT"
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
              return databaseCreation_Optimizer();
            }
          }
          break;
        case 'LtcVehInfo':
          try {
            final Future<Database> database = openDatabase(
              tempPath,
              onCreate: (dbref, version) {
                return dbref.execute(
                  "CREATE TABLE $dbTableName("
                  // Veh Info Columns
                      "midPlate TEXT PRIMARY KEY, "
                      "vehType TEXT, "
                      "classType TEXT, "
                      "currentOdo TEXT"
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
              return databaseCreation_Optimizer();
            }
          }
          break;
        case 'LtcVehTripsInfo':
          try {
            final Future<Database> database = openDatabase(
              tempPath,
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
              return databaseCreation_Optimizer();
            }
          }
          break;
      }
      if (count == 0)
      {
        buildBaseDBData();
      }
    }



    // Just to check if table exists
    callConversion();
  }

  // Func to call once app opens
  void openTheDatabase(String path) async
  {
    db = await openDatabase(path);
  }

  Future<void> insertNewData(var theData) async
  {

    if (db == null)
    {
      return;
    }

    if (theData is FullDetailSet)
    {
      FullDetailSet fDS = theData;

      final Database database = await db;

      await database.insert(dbTableName, fDS.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

    }

    else if (theData is FullVehicleDetailSet)
    {
      FullVehicleDetailSet fVDS = theData;

      final Database database = await db;

      await database.insert(dbTableName, fVDS.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

    }


  callConversion();

  }

  Future<LoginCredential> getLoginCreds(String email) async
  {
    Database database = await db;
    List<Map> result = await database.rawQuery('SELECT * FROM LtcPersonnelInfo WHERE email=?', [email]);
    // TODO: Get password from result to return for login authorization
    String checker = result.toString();
    if (checker.contains("password"))
    {

    }
  }

  void callConversion() async
  {
//    dbPath = await getDatabasesPath();
//   tempPath = join(dbPath, dbName);

    bool result = await databaseExists(tempPath);
    if (result == true)
    {
      // Send database data into a string
      // Doesn't work right now due to null db data
      var dbToConvert = await db;
      var dbConversionUnit = await dbToConvert.query(dbTableName);
      print((Sqflite.firstIntValue(await dbToConvert.rawQuery('SELECT COUNT(*) FROM $dbTableName'))).toString() + 'Rows');
      // TODO; Fix character limit to properly print out
      String printo = mapListToCsv(dbConversionUnit);
      //       print(printo);
      // Create file to send db data into
      File file = await new File(dbPath + '/$dbTableName.csv');
      file.create(recursive: true);
      file.writeAsString(printo);
      // Spit the data written into file out into console
      var read = new File(dbPath + '/$dbTableName.csv').readAsString();
      String content = await read;
      print(content);

    }

  }

  void buildBaseDBData()
  {
    switch (dbTableName)
    {
      case 'LtcPersonnelInfo':
        var fDS = new FullDetailSet();
        fDS.sortPersonalData('Test Man', '281A', '5 Cresent Ave', '84569018', '67889231', dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), 'A2', ReligionType.Christianity.toString(), RaceType.Chinese.toString(), BloodType.AB_PLUS.toString(), 'None', 'None', 'Testing Man', '97810781', '5 Cresent Ave', VocationType.TO.toString(), 'Stay In', 'None');
        fDS.sortTrainingData('Basic Transport', '290121-210221', 1, 'MID46112', VehLicenseType.class3.toString(), dtGetter.Date(DateTime.now()));
        fDS.sortEducationData('Junior College', 'Pure Sciences', 'Soccer Club', 'K.Ickers');
        fDS.sortMiscData('Drinking; Driving; Drink Driving', VehLicenseType.class2.toString(), 'M2811345', dtGetter.Date(DateTime.now()), TrueOrFalseType.True.toString(), TrueOrFalseType.True.toString(), 'FAG69781023', ClothesSizeType.M.toString(), 70, 100, 9);
        fDS.loginCredentials = new LoginCredential(username: "test@email.com", password: "123");
        insertNewData(fDS);
        break;
      case 'LtcVehInfo':
        var fVDS = new FullVehicleDetailSet();
        fVDS.sortData('S69420', VehType.AType.toString(), VehClassType.BType.toString(), '696969');
        insertNewData(fVDS);
        break;
      case 'LtcVehTripsInfo':
        break;
    }

    //  for (int i = 0; i < 4; i++)
    //    {
    //      fDS.personalDataSet.fullName = fDS.personalDataSet.fullName + i.toString();
    //      insertNewData(fDS);
    //    }

  }

  DatabaseHandler({this.dbName, this.dbTableName});
}