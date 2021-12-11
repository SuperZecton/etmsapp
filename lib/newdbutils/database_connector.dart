//import 'dart:html';

import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/results/results.dart';
//import 'package:dart_mssql/dart_mssql.dart';

class PersonnelDatabaseHandler {
  PersonnelDatabaseHandler();
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

  Future<String> SingleDataPull(String table, String collumIdentifier, String collumIdentifierValue, String neededCollum) async {
    var settings = new ConnectionSettings(
        user: 'LTCAppuser',
        password: 'LTCuser123',
        host: '116.89.31.147',
        port: 3306,
        db: 'test');
    var conn = await MySqlConnection.connect(settings);
    var querystring =
        "SELECT `" + neededCollum + "` FROM " + table + " WHERE `" + collumIdentifier + "` = '" + collumIdentifierValue + "';";
    print("Query String: " + querystring);
    Results results = await (await conn.execute(querystring)).deStream();
    print("Database Result: " + results.toString());
    var rawValue = results.toString();
    conn.close();
    var value = rawValue.substring(2, rawValue.length - 2);
    return value;
  }

}
