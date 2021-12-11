//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/results/results.dart';
//import 'package:dart_mssql/dart_mssql.dart';

class PersonnelDatabaseHandler {
  PersonnelDatabaseHandler();

  // Local DB Creation and management
/*  @override
  Future<void> databaseCreationOptimizer() async
  {
    dbPath = await getDatabasesPath();
    dbPath = join(dbPath, dbName);

    bool result = await databaseExists(dbPath);

 /*   if (result == true)
      {
        this.db = await openDatabase(dbPath);
      }
      else
        {
        */
      try {
        final Future<Database> database = openDatabase(
          dbPath,
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
                  "NOKDetailFullName TEXT, "
                  "NOKDetailContactNumber TEXT, "
                  "NOKDetailFullAddress TEXT, "
                  "vocationType TEXT, "
                  "stayInStayOut TEXT, "
                  "medicalConditions TEXT, "
              // Section 2: Training Information
                  "trainingFrame TEXT, "
                  "trainingPeriod TEXT, "
                  "passAttempts INTEGER, "
                  "militaryLicenseNo TEXT, "
                  "militaryLicenseType TEXT, "
                  "militaryLicenseDateOfIssue TEXT, "
              // Section 3: Education
                  "educationLevel TEXT, "
                  "streamCourseName TEXT, "
                  "ccaOptional TEXT, "
                  "schName TEXT, "
              // Section 4: Other Information
                  "hobbiesInterest TEXT, "
                  "civilianLicenseType TEXT, "
                  "civilianLicenseNumber TEXT, "
                  "civilianLicenseDateOfIssue TEXT, "
                  "hasDoneDefensiveCourse TEXT, "
                  "hasPersonalVehicle TEXT, "
                  "personalVehiclePlateNumber TEXT, "
                  "tShirtSize TEXT, "
                  "no3SizeUpperTorso INTEGER, "
                  "no3SizeWaist INTEGER, "
                  "no3SizeShoes INTEGER, "
              // Section 5: Login Information
                  "username TEXT, "
                  "password TEXT"
                  ")",
            );
          },
          version: 1,
        );

        db = database;

        if (db != null) {
          result = true;
        }

        db = database;
      } catch (result) {
        if (result == false) {
          return databaseCreationOptimizer();
        }
      }


    await getTableAsWhole();

    establishMySQLConnection();



    callConversion();
  }

*/
  /*Future<bool> verifyLoginCreds(String email, String pass) async
  {
    switch (mySQLConnectionInstance)
    {
      case null: // No connection to MySQL DB
      {
        if (db == null)
        {
          print("Error: Database was not created.");
          return false;
        }

        // Weak-ass stopgap to prevent empty logins
        if (email == "")
        {
          return false;
        }

        Database database = await db;
        String targetColumn = 'password';
        List<Map> result;
        try
        {
          result = await database.rawQuery(
              'SELECT $targetColumn '
                  'FROM $dbTableName '
                  'WHERE email=? '
                  '', [email]);

          String checker = result.toString();
          print("This is the current response from the password query: " + checker);
          print ((await isolateChar(targetColumn ,checker)).toString());


          return checker.contains(pass);
        }
        catch (_)
        {
          print("Table name invalid. $dbTableName not found.");
          return false;
        }
      }
        break;
      default:
        {
                  var results = await getMySQLDataFromExistingData("password", email, "username");
          // Conversion Guide
          //        await mySQLConnectionInstance.query(""
          //           "select password "
          //            "from LTC_PERSONNEL_INFO "
          //            "where username = ?"
          //             "", [email]);
                for (var row in results)
                  {
                    print("Obtained Password: " + row[0].toString() + "  Input Password: " + pass);
                    if (row[0] == pass)
                      {
                        mySQLConnectionInstance.close();
                        return true;
                      }
                  }
        }
        break;
    }

  }*/
/*
  @override
  Future<void> buildBaseDBData() async
  {
    var fDS = new FullDetailSet();
    fDS.sortPersonalData('Test Man', '281A', '5 Cresent Ave', '84569018', '67889231', dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), dtGetter.Date(DateTime.now()), 'A2', ReligionType.Christianity.toString(), RaceType.Chinese.toString(), BloodType.AB_PLUS.toString(), 'None', 'None', 'Testing Man', '97810781', '5 Cresent Ave', VocationType.TO.toString(), 'Stay In', 'None');
    fDS.sortTrainingData('Basic Transport', '290121-210221', 1, 'MID46112', VehLicenseType.class3.toString(), dtGetter.Date(DateTime.now()));
    fDS.sortEducationData('Junior College', 'Pure Sciences', 'Soccer Club', 'K.Ickers');
    fDS.sortMiscData('Drinking; Driving; Drink Driving', VehLicenseType.class2.toString(), 'M2811345', dtGetter.Date(DateTime.now()), TrueOrFalseType.True.toString(), TrueOrFalseType.True.toString(), 'FAG69781023', ClothesSizeType.M.toString(), 70, 100, 9);
    fDS.loginCredentials = new LoginCredential(username: "test@email.com", password: "123");
    insertNewRow(fDS);
  }
*/

  Future<void> DBFunctionTemplate(String value) async {
    // In MYSQL, use ` (backticks) for Columns Eg. `Username`
    // use ' (apostrophe) for Values Eg. 'elephant123'
    // End MYSQL Query with ;

    var settings = new ConnectionSettings(
        user: 'LTCAppuser',
        password: 'LTCuser123',
        host: '116.89.31.147',
        port: 3306,
        db: 'test');
    var conn = await MySqlConnection.connect(settings);
    var querystring =
        "SELECT `Password` FROM Users WHERE `Username` = '" + value + "';";
    print("Query String: " + querystring);
    Results results = await (await conn.execute(querystring)).deStream();
    print("Database Result: " + results.toString());
    value = results.toString();
    conn.close();
  }

  Future<bool> verifyLoginCreds(String username, String pass) async {
    var settings = new ConnectionSettings(
        user: 'LTCAppuser',
        password: 'LTCuser123',
        host: '116.89.31.147',
        port: 3306,
        db: 'test');
    var conn = await MySqlConnection.connect(settings);
    var querystring =
        "SELECT `Password` FROM Users WHERE `Username` = '" + username + "';";
    print("Query String: " + querystring);
    Results pwfromdb = await (await conn.execute(querystring)).deStream();
    print("Database Result: " + pwfromdb.toString());
    conn.close();
    if (pwfromdb.toString() == "([" + pass + "])") {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createUserAccount(
      String fullName,
      String nricLast4Digits,
      String fullHomeAddress,
      String handphoneNumber,
      String homephoneNumber,
      String personalEmail,
      String dateOfBirth,
      String dateOfEnlistment,
      String dateOfORD,
      String dateOfPostIn,
      String pesType,
      String religion,
      String race,
      String bloodGroup,
      String drugAllergy,
      String foodAllergy,
      String NOKDetailFullName,
      String NOKDetailContactNumber,
      String NOKDetailFullAddress,
      String vocationType,
      String stayInStayOut,
      String medicalConditions,
      String trainingFrame,
      String trainingPeriod,
      String passAttempts,
      String militaryLicenseNo,
      String militaryLicenseType,
      String militaryLicenseDateOfIssue,
      String educationLevel,
      String streamCourseName,
      String ccaOptional,
      String schName,
      String hobbiesInterest,
      String civilianLicenseType,
      String civilianLicenseNumber,
      String civilianLicenseDateOfIssue,
      String hasDoneDefensiveCourse,
      String hasPersonalVehicle,
      String personalVehiclePlateNumber,
      String tShirtSize,
      String no3SizeUpperTorso,
      String no3SizeWaist,
      String no3SizeShoes,
      String username,
      String password) async {

    var settings = new ConnectionSettings(
        user: 'LTCAppuser',
        password: 'LTCuser123',
        host: '116.89.31.147',
        port: 3306,
        db: 'test');
    var conn = await MySqlConnection.connect(settings);
    var querystring =
        "INSERT INTO Users (`UUID`, `fullName`, `nricLast4Digits`, `fullHomeAddress`, `handphoneNumber`, `homephoneNumber`, `personalEmail`, `dateOfBirth`, `dateOfEnlistment`, `dateOfORD`, `dateOfPostIn`, `pesType`, `religion`, `race`, `bloodGroup`, `drugAllergy`, `foodAllergy`, `NOKDetailFullName`, `NOKDetailContactNumber`, `NOKDetailFullAddress`, `vocationType`, `stayInStayOut`, `medicalConditions`, `trainingFrame`, `trainingPeriod`, `passAttempts`, `militaryLicenseNo`, `militaryLicenseType`, `militaryLicenseDateOfIssue`, `educationLevel`, `streamCourseName`, `ccaOptional`, `schName`, `hobbiesInterest`, `civilianLicenseType`, `civilianLicenseNumber`, `civilianLicenseDateOfIssue`, `hasDoneDefensiveCourse`, `hasPersonalVehicle`, `personalVehiclePlateNumber`, `tShirtSize`, `no3SizeUpperTorso`, `no3SizeWaist`, `no3SizeShoes`, `username`, `password`) "
        "VALUES (UUID(),'"+fullName+"','"+nricLast4Digits+"','"+fullHomeAddress+"','"+handphoneNumber+"','"+homephoneNumber+"','"+personalEmail+"','"+dateOfBirth+"','"+dateOfEnlistment+"','"+dateOfORD+"','"+dateOfPostIn+"','"+pesType+"','"+religion+"','"+race+"','"+bloodGroup+"','"+drugAllergy+"','"+foodAllergy+"','"+NOKDetailFullName+"','"+NOKDetailContactNumber+"','"+NOKDetailFullAddress+"','"+vocationType+"','"+stayInStayOut+"','"+medicalConditions+"','"+trainingFrame+"','"+trainingPeriod+"','"+passAttempts+"','"+militaryLicenseNo+"','"+militaryLicenseType+"','"+militaryLicenseDateOfIssue+"','"+educationLevel+"','"+streamCourseName+"','"+ccaOptional+"','"+schName+"','"+hobbiesInterest+"','"+civilianLicenseType+"','"+civilianLicenseNumber+"','"+civilianLicenseDateOfIssue+"','"+hasDoneDefensiveCourse+"','"+hasPersonalVehicle+"','"+personalVehiclePlateNumber+"','"+tShirtSize+"','"+no3SizeUpperTorso+"','"+no3SizeWaist+"','"+no3SizeShoes+"','"+username+"','"+password+"');";
    print("Query String: " + querystring);
    Results results = await (await conn.execute(querystring)).deStream();
    print("Database Result: " + results.toString());
    conn.close();
  }
}
