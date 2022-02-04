//import 'dart:html';

import 'package:ltcapp/features/registration/model/individual_identity.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:postgres/postgres.dart';
//import 'package:dart_mssql/dart_mssql.dart';

class DatabaseHandler {
  DatabaseHandler();

  Future<void> DBFunctionTemplate(String value) async {
    // In PostgreSQL, use " (double quotes) for Columns Eg. "Username"
    // use ' (apostrophe) for Values Eg. 'elephant123'
    // End PostgreSQL Query with ;

    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "fullName" FROM Users WHERE' " username = '" + value + "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    value = results.toString();
    connection.close();
  }

  Future<bool> verifyLoginCreds(String username, String pass) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = 'SELECT "password" FROM Users WHERE "username" = ' "'" +
        username +
        "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
    if (results.toString() == "[[" + pass + "]]") {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createUserAccount(
      String rank,
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
      String LTCTraining,
      String drivingCategory,
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
      String password,
      String permissionsLevel,
      String remarks) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO Users ("UUID", "rank", "fullName", "nricLast4Digits", "fullHomeAddress", "handphoneNumber", "homephoneNumber", "personalEmail", "dateOfBirth", "dateOfEnlistment", "dateOfORD", "dateOfPostIn", "pesType", "religion", "race", "bloodGroup", "drugAllergy", "foodAllergy", "NOKDetailFullName", "NOKDetailContactNumber", "NOKDetailFullAddress", "vocationType", "stayInStayOut", "medicalConditions", "trainingFrame", "trainingPeriod", "passAttempts", "militaryLicenseNo", "militaryLicenseType", "militaryLicenseDateOfIssue", "LTCTraining", "drivingCategory", "educationLevel", "streamCourseName", "ccaOptional", "schName", "hobbiesInterest", "civilianLicenseType", "civilianLicenseNumber", "civilianLicenseDateOfIssue", "hasDoneDefensiveCourse", "hasPersonalVehicle", "personalVehiclePlateNumber", "tShirtSize", "no3SizeUpperTorso", "no3SizeWaist", "no3SizeShoes", "username", "password", "permissionLevel", "remarks") '
                "VALUES (uuid_generate_v4(),'" +
            rank +
            "','" +
            fullName +
            "','" +
            nricLast4Digits +
            "','" +
            fullHomeAddress +
            "','" +
            handphoneNumber +
            "','" +
            homephoneNumber +
            "','" +
            personalEmail +
            "','" +
            dateOfBirth +
            "','" +
            dateOfEnlistment +
            "','" +
            dateOfORD +
            "','" +
            dateOfPostIn +
            "','" +
            pesType +
            "','" +
            religion +
            "','" +
            race +
            "','" +
            bloodGroup +
            "','" +
            drugAllergy +
            "','" +
            foodAllergy +
            "','" +
            NOKDetailFullName +
            "','" +
            NOKDetailContactNumber +
            "','" +
            NOKDetailFullAddress +
            "','" +
            vocationType +
            "','" +
            stayInStayOut +
            "','" +
            medicalConditions +
            "','" +
            trainingFrame +
            "','" +
            trainingPeriod +
            "','" +
            passAttempts +
            "','" +
            militaryLicenseNo +
            "','" +
            militaryLicenseType +
            "','" +
            militaryLicenseDateOfIssue +
            "','" +
            LTCTraining +
            "','" +
            drivingCategory +
            "','" +
            educationLevel +
            "','" +
            streamCourseName +
            "','" +
            ccaOptional +
            "','" +
            schName +
            "','" +
            hobbiesInterest +
            "','" +
            civilianLicenseType +
            "','" +
            civilianLicenseNumber +
            "','" +
            civilianLicenseDateOfIssue +
            "','" +
            hasDoneDefensiveCourse +
            "','" +
            hasPersonalVehicle +
            "','" +
            personalVehiclePlateNumber +
            "','" +
            tShirtSize +
            "','" +
            no3SizeUpperTorso +
            "','" +
            no3SizeWaist +
            "','" +
            no3SizeShoes +
            "','" +
            username +
            "','" +
            password +
            "','" +
            permissionsLevel +
            "','" +
            remarks +
            "');";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
  }

  Future<String> singleDataPull(String table, String collumIdentifier,
      String collumIdentifierValue, String neededCollum) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = 'SELECT "' +
        neededCollum +
        '" FROM ' +
        table +
        ' WHERE "' +
        collumIdentifier +
        '"' " = '" +
        collumIdentifierValue +
        "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    var rawValue = results.toString();
    connection.close();
    var value = rawValue.substring(2, rawValue.length - 2);
    return value;
  }

  Future<void> createVehicle(
      String vehicleNo,
      String carModel,
      String classType,
      String status,
      String lastAVIDate,
      String nextAVIDate,
      String lastWPTDate,
      String nextWPTDate,
      String additionalPlate,
      String additionalRemarks) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO Vehicles ("UUID", "vehicleNo", "carModel", "classType", "status", "lastAVIDate", "nextAVIDate", "lastWPTDate", "nextWPTDate", "additionalPlate", "additionalRemarks") '
                "VALUES (uuid_generate_v4(),'" +
            vehicleNo +
            "','" +
            carModel +
            "','" +
            classType +
            "','" +
            status +
            "','" +
            lastAVIDate +
            "','" +
            nextAVIDate +
            "','" +
            lastWPTDate +
            "','" +
            nextWPTDate +
            "','" +
            additionalPlate +
            "','" +
            additionalRemarks +
            "');";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
  }

  Future<void> editSingleDataEntry(
      String table,
      String collumIdentifier,
      String collumIdentifierValue,
      String editingCollum,
      String editingCollumValue) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = "UPDATE " +
        table +
        ' SET "' +
        editingCollum +
        '" = ' "'" +
        editingCollumValue +
        "' WHERE " '"' +
        collumIdentifier +
        '"' " = '" +
        collumIdentifierValue +
        "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
  }

  Future<void> createLoginEntry(String deviceIdentifier, String username,
      String password, String date, String time) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO RememberLogin ("UUID", "deviceIdentifier", "username", "password", "date", "time") '
                "VALUES (uuid_generate_v4(),'" +
            deviceIdentifier +
            "','" +
            username +
            "','" +
            password +
            "','" +
            date +
            "','" +
            time +
            "');";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
  }

  Future<bool> checkLoginEntry(String deviceIdentifier, String username) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "username" FROM RememberLogin WHERE "deviceIdentifier" = ' "'" +
            deviceIdentifier +
            "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    connection.close();
    if (results.toString() == "[" + username + "]") {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> findLoginEntry(
      //This Function takes in deviceIdentifier and returns username and password
      String deviceIdentifier) async {
    bool _ignoreTime = true;
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT * FROM RememberLogin WHERE "deviceIdentifier" = ' "'" +
            deviceIdentifier +
            "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    if (results.toString() == "[]") {
      print("No Entry with match Device Identifier");
      print("Can't find UUID");
      return [];
    } else {
      var storingDate = [];
      var storingDateString = [];
      var storingTime = [];
      var storingTimeString = [];
      var querystring1;
      var querystring =
          'SELECT "date" FROM RememberLogin WHERE "deviceIdentifier" = ' "'" +
              deviceIdentifier +
              "';";
      print("Query String: " + querystring);
      List<dynamic> results = await connection.query(querystring);
      results.forEach((row) {
        print("Database Result: " + row.toString());
        var rawdate = row.toString().substring(1, row.toString().length - 1);
        var date = rawdate.split("/");
        var d1 = DateTime.utc(
            int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
        storingDate.add(d1);
        storingDateString.add(rawdate);
      });
      if (storingDate.length != 1) {
        for (int i = 0; i < storingDate.length; i++) {
          for (int j = 0; j < storingDate.length - i; j++) {
            if (storingDate[j].compareTo(storingDate[j + 1]) < 0) {
              DateTime temp = storingDate[j];
              storingDate[j] = storingDate[j + 1];
              storingDate[j + 1] = temp;
              DateTime temp1 = storingDateString[j];
              storingDateString[j] = storingDateString[j + 1];
              storingDateString[j + 1] = temp1;
            }
          }
        }
        print('Storing Date is ' + storingDate.toString());
        if (storingDate[0] == storingDate[1]) {
          _ignoreTime = false;
          var samedate = storingDate[0].day.toString() +
              "/" +
              storingDate[0].month.toString() +
              "/" +
              storingDate[0].year.toString();
          var querystring =
              'SELECT "time" FROM RememberLogin WHERE "deviceIdentifier" = ' "'" +
                  deviceIdentifier +
                  "'" ' AND "date" = ' "'" +
                  samedate +
                  "';";
          print("Query String: " + querystring);
          List<dynamic> results = await connection.query(querystring);
          results.forEach((row) {
            print("Database Result: " + row.toString());
            var rawtime = row.toString().substring(1, row
                .toString()
                .length - 1);
            var t1 = DateTime.utc(
                2021,
                12,
                18,
                int.parse(rawtime.substring(0, rawtime.length - 4)),
                int.parse(rawtime.substring(2, rawtime.length - 2)),
                int.parse(rawtime.substring(4, rawtime.length)));
            storingTime.add(t1);
          });
          for (int x = 0; x < storingTime.length - 1; x++) {
            for (int y = 0; y < storingTime.length - x - 1; y++) {
              if (storingTime[y].compareTo(storingTime[y + 1]) < 0) {
                DateTime temp = storingTime[y];
                storingTime[y] = storingTime[y + 1];
                storingTime[y + 1] = temp;
              }
            }
          }
          print('Storing time is ' + storingTime.toString());
        }
/*      var entrydate = storingDate[0].day.toString().padLeft(2, '0') +
          "/" +
          storingDate[0].month.toString().padLeft(2, '0') +
          "/" +
          storingDate[0].year.toString();*/
        var entrydate = storingDateString[0];
        print("Date of Last Login: " + entrydate);
        if (_ignoreTime == false) {
          var entrytime = storingTime[0].hour.toString().padLeft(2, '0') +
              storingTime[0].hour.toString().padLeft(2, '0') +
              storingTime[0].hour.toString().padLeft(2, '0');
          querystring1 =
              'SELECT "username", "password" FROM RememberLogin WHERE "deviceIdentifier" = '
                  "'" +
                  deviceIdentifier +
                  "'" ' AND "date" = ' "'" +
                  entrydate +
                  "'" ' AND "time" = ' "'" +
                  entrytime +
                  "';";
        }
        else {
          querystring1 =
              'SELECT "username", "password" FROM RememberLogin WHERE "deviceIdentifier" = '
                  "'" +
                  deviceIdentifier +
                  "'" ' AND "date" = ' "'" +
                  entrydate +
                  "';";
        }
      }
      else {
        querystring1 =
            'SELECT "username", "password" FROM RememberLogin WHERE "deviceIdentifier" = '
                "'" +
                deviceIdentifier +
                "'" ' AND "date" = ' "'" +
                storingDateString[0] +
                "';";
      }
      print("Query String : " + querystring1);
      List<dynamic> results1 = await connection.query(querystring1);
      print("Database Result: " + results1.toString());
      var userpass = [];
      results1.forEach((row) {
        userpass.add(row);
      });
      return userpass[0];
    }
  }

  Future<String> startTrip(
      String username,
      String date,
      String vehicleNo,
      String timeStart,
      String odometerStart,
      String locationStart,
      String purposeOfTrip,
      String classType) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO Logging ("UUID", "username", "date", "vehicleNo", "timeStart", "odometerStart", "locationStart", "purposeOfTrip", "classType") ' +
            "VALUES (uuid_generate_v4(),'" +
            username +
            "','" +
            date +
            "','" +
            vehicleNo +
            "','" +
            timeStart +
            "','" +
            odometerStart +
            "','" +
            locationStart +
            "','" +
            purposeOfTrip +
            "','" +
            classType +
            "');";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    var querystring2 =
        'SELECT "UUID" FROM logging WHERE "username"=' "'" + username + "';";
    print("Query String: " + querystring2);
    var results2 = await connection.query(querystring2);
    print("Database Result: " + results2.toString());
    var rawValue = results2.toString();
    var value = rawValue.substring(2, rawValue.length - 2);
    connection.close();
    return value;
  }

  Future<void> endTrip(String UUID, String mileage, String timeEnd,
      String odometerEnd, String locationEnd) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = "UPDATE logging " +
        'SET "timeEnd" = ' "'" +
        timeEnd +
        "', " '"odometerEnd" = ' "'" +
        odometerEnd +
        "', " '"locationEnd" = ' "'" +
        locationEnd +
        "', " '"mileage" = ' "'" +
        mileage.toString() +
        "' WHERE " '"UUID" = ' +
        UUID +
        ";";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
  }
}
