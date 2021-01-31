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

  void setDatabasePath(String path)
  {
    tempPath = path;
  }

  void databaseCreation_Optimizer() async
  {
    dbPath = await getDatabasesPath();
    tempPath = join(dbPath, dbName);

    bool result = await databaseExists(tempPath);

    if (result != true)
    {
      // First time launch SOP

      try {
        final Future<Database> database = openDatabase(
          tempPath,
          onCreate: (dbref, version) {
            return dbref.execute(
              // The pain
                "CREATE TABLE LtcPersonnelInfo("
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
          version: 3,
        );

        db = database;
      } catch (_){}

    }
  else
    {
        openTheDatabase(tempPath);
//        callConversion();
    }

    dbPath = tempPath;
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

    await database.insert('LtcPersonnelInfo', fullDetailSet.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
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
        String printo = mapListToCsv(db);
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

  DatabaseHandler({this.dbName});
}