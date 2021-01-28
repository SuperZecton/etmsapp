import 'dart:async';
import 'package:async/async.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'individual_identity.dart';


class DatabaseHandler {
  // The pointer to the database itself
  var db;


  String dbPath;
  String tempPath;

  String dbName;

  Future<bool> dataBaseChecker()
  {
    return databaseExists(dbPath);
  }

  void databaseCreation_Optimizer() async
  {
    dbPath = await getDatabasesPath();
    tempPath = join(dbPath, dbName);

    if (!(await databaseExists(tempPath)))
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
                    "vocationType ENUM(TO, STO, TOA), "
                    "stayInstayOut TEXT, "
                    "medicalConditions TEXT, "
                // Section 2: Training Information
                    "trainingFrame TEXT, "
                    "trainingPeriod TEXT, "
                    "passAttempts INTEGER, "
                    "militaryLicenseNo TEXT, "
                    "militaryLicenseType ENUM(none, class2, class2A, class3, class3A, class4), "
                    "milLicenseDateOfIssue DATE, "
                // Section 3: Education
                    "educationLevel TEXT, "
                    "streamcourseName TEXT, "
                    "ccaOptional TEXT, "
                // Section 4: Other Information
                    "hobbiesInterest TEXT, "
                    "civillianLicenseType ENUM(none, class2, class2A, class3, class3A, class4), "
                    "civillianLicenseNumber TEXT, "
                    "civillianLicenseDateOfIssue DATE, "
                    "hasDoneDefensiveCourse BOOL, "
                    "hasPersonalVehicle BOOL, "
                    "personalVehiclePlateNumber TEXT, "
                    "tShirtSize ENUM(XS, S, M, L, XL), "
                    "no3sizeUpperTorso INTEGER, "
                    "no3sizeWaist INTEGER, "
                    "no3sizeShoes INTEGER"
                    ")"
              );
            },
            version: 2,
          );

          db = database;
        } catch (_){}

  }

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

  DatabaseHandler({this.dbName});
}