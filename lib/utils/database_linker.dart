import 'dart:async';
import 'package:async/async.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'csv_utils.dart';
import 'package:csv/csv.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'individual_identity.dart';
import 'dart:io';


class DatabaseHandler {
  // The pointer to the database itself
  var db;


  String dbPath;
  String tempPath;

  String dbName;
  final String dbTableName = 'LtcPersonnelInfo';

  void setDatabasePath(String path)
  {
    tempPath = path;
  }

  void databaseCreation_Optimizer() async
  {
    dbPath = await getDatabasesPath();
    tempPath = join(dbPath, dbName);

    bool result = await databaseExists(tempPath);

    if (result == true)
    {
      // First time launch SOP

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
                    "handphoneNumber INTEGER, "
                    "homephoneNumber INTEGER, "
                    "dateOfBirth DATE, "
                    "dateOfEnlistment DATE, "
                    "dateOfORD DATE, "
                    "dateOfPostIn DATE, "
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
                    "milLicenseDateOfIssue DATE, "
                // Section 3: Education
                    "educationLevel TEXT, "
                    "streamcourseName TEXT, "
                    "ccaOptional TEXT, "
                // Section 4: Other Information
                    "hobbiesInterest TEXT, "
                    "civillianLicenseType TEXT, "
                    "civillianLicenseNumber TEXT, "
                    "civillianLicenseDateOfIssue DATE, "
                    "hasDoneDefensiveCourse BOOL, "
                    "hasPersonalVehicle BOOL, "
                    "personalVehiclePlateNumber TEXT, "
                    "tShirtSize TEXT, "
                    "no3sizeUpperTorso INTEGER, "
                    "no3sizeWaist INTEGER, "
                    "no3sizeShoes INTEGER"
                    ")"
            );
          },
          version: 1,
        );

        db = database;
      } catch (_){}

    }
  else
    {
        openTheDatabase(tempPath);
    }

    buildBaseDBData();
    // Just to check if table exists
    callConversion();
  }

  // Func to call once app opens
  void openTheDatabase(String path) async
  {
    db = await openDatabase(path);
  }

  Future<void> insertNewData(FullDetailSet fullDetailSet) async
  {
    if (db == null)
    {
      return;
    }

    final Database database = await db;

    await database.insert(dbTableName, fullDetailSet.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void callConversion() async
  {
    dbPath = await getDatabasesPath();
    tempPath = join(dbPath, dbName);

    bool result = await databaseExists(tempPath);
    if (result == true)
      {
        // Send database data into a string
        // Doesn't work right now due to null db data
        var dbToConvert = await db;
        var dbConversionUnit = await dbToConvert.query(dbTableName);
        String printo = mapListToCsv(dbConversionUnit);
        // Create file to send db data into
        File file = await new File(dbPath + '/test.csv');
        file.create(recursive: true);
        file.writeAsString(printo);
        // Spit the data written into file out into console
        var read = new File(dbPath + '/test.csv').readAsString();
        String content = await read;
        print(content);

      }

  }

  void buildBaseDBData()
  {
    var fDS = new FullDetailSet();
    fDS.sortPersonalData('Test Man', '281A', '5 Cresent Ave', '84569018', '67889231', DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), 'A2', ReligionType.Christianity.toString(), RaceType.Chinese.toString(), BloodType.AB_PLUS.toString(), 'None', 'None', 'Testing Man', '97810781', '5 Cresent Ave', VocationType.TO.toString(), 'Stay In', 'None');
    fDS.sortTrainingData('Basic Transport', '290121-210221', 1, 'MID46112', VehLicenseType.class3.toString(), DateTime.now().toString());
    fDS.sortEducationData('Junior College', 'Pure Sciences', 'Soccer Club');
    fDS.sortMiscData('Drinking, Driving, Drink Driving', VehLicenseType.class2.toString(), 'M2811345', DateTime.now().toString(), TrueOrFalseType.True.toString(), TrueOrFalseType.True.toString(), 'FAG69781023', ClothesSizeType.M.toString(), 70, 100, 9);
    insertNewData(fDS);
  }

  DatabaseHandler({this.dbName});
}