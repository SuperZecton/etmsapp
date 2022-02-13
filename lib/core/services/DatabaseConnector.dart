//import 'dart:html';

import 'package:flutter/material.dart';
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
      String totalClass3Mileage,
      String totalClass4Mileage,
      String remarks) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO Users ("UUID", "rank", "fullName", "nricLast4Digits", "fullHomeAddress", "handphoneNumber", "homephoneNumber", "personalEmail", "dateOfBirth", "dateOfEnlistment", "dateOfORD", "dateOfPostIn", "pesType", "religion", "race", "bloodGroup", "drugAllergy", "foodAllergy", "NOKDetailFullName", "NOKDetailContactNumber", "NOKDetailFullAddress", "vocationType", "stayInStayOut", "medicalConditions", "trainingFrame", "trainingPeriod", "passAttempts", "militaryLicenseNo", "militaryLicenseType", "militaryLicenseDateOfIssue", "LTCTraining", "drivingCategory", "educationLevel", "streamCourseName", "ccaOptional", "schName", "hobbiesInterest", "civilianLicenseType", "civilianLicenseNumber", "civilianLicenseDateOfIssue", "hasDoneDefensiveCourse", "hasPersonalVehicle", "personalVehiclePlateNumber", "tShirtSize", "no3SizeUpperTorso", "no3SizeWaist", "no3SizeShoes", "username", "password", "permissionLevel", "totalClass3Mileage", "totalClass4Mileage", "remarks") '
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
            totalClass3Mileage +
            "','" +
            totalClass4Mileage +
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
      String carType,
      String classType,
      String status,
      String inUse,
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
        'INSERT INTO Vehicles ("UUID", "vehicleNo", "carModel", "carType", "classType", "status", "inUse", "lastAVIDate", "nextAVIDate", "lastWPTDate", "nextWPTDate", "additionalPlate", "additionalRemarks") '
                "VALUES (uuid_generate_v4(),'" +
            vehicleNo +
            "','" +
            carModel +
            "','" +
            carType +
            "','" +
            classType +
            "','" +
            status +
            "','" +
            inUse +
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

  Future<void> checkAndCreateLoginEntry(String deviceIdentifier,
      String username, String password, String date, String time) async {
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
    if (results.toString() == "[[" + username + "]]") {
      var querystring = "UPDATE RememberLogin" +
          ' SET "date" = ' +
          "'" +
          date +
          "', " +
          '"time" = ' +
          "'" +
          time +
          "' WHERE " '"deviceIdentifier" = ' "'" +
          deviceIdentifier +
          "' AND " '"username" = ' "'" +
          username +
          "';";
      print("Query String: " + querystring);
      var results = await connection.query(querystring);
      print("Database Result: " + results.toString());
    } else {
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
    }
    connection.close();
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
      if (storingDate.length == 2) {
        if (storingDate[0].compareTo(storingDate[1]) < 0) {
          DateTime temp = storingDate[0];
          storingDate[0] = storingDate[1];
          storingDate[1] = temp;
          String temp1 = storingDateString[0];
          storingDateString[0] = storingDateString[1];
          storingDateString[1] = temp1;
        }
        if (storingDate[0] == storingDate[1]) {
          _ignoreTime = false;
          var samedate = storingDateString[0];
          var querystring =
              'SELECT "time" FROM RememberLogin WHERE "deviceIdentifier" = '
                      "'" +
                  deviceIdentifier +
                  "'" ' AND "date" = ' "'" +
                  samedate +
                  "';";
          print("Query String: " + querystring);
          List<dynamic> results = await connection.query(querystring);
          results.forEach((row) {
            print("Database Result: " + row.toString());
            var rawtime =
                row.toString().substring(1, row.toString().length - 1);
            var t1 = DateTime.utc(
                2021,
                12,
                18,
                int.parse(rawtime.substring(0, rawtime.length - 4)),
                int.parse(rawtime.substring(2, rawtime.length - 2)),
                int.parse(rawtime.substring(4, rawtime.length)));
            storingTime.add(t1);
          });
          if (storingTime[0].compareTo(storingTime[1]) < 0) {
            DateTime temp = storingTime[0];
            storingTime[0] = storingTime[1];
            storingTime[1] = temp;
          }
        }
      }
      else if (storingDate.length != 1) {
        for (int i = 0; i < storingDate.length - 1; i++) {
          for (int j = 0; j < storingDate.length - i - 1; j++) {
            if (storingDate[i].compareTo(storingDate[i + 1]) < 0) {
              DateTime temp = storingDate[i];
              storingDate[i] = storingDate[i + 1];
              storingDate[i + 1] = temp;
              String temp1 = storingDateString[i];
              storingDateString[i] = storingDateString[i + 1];
              storingDateString[i + 1] = temp1;
            }
          }
        }
        print('Storing Date is ' + storingDateString[0]);
        if (storingDate[0] == storingDate[1]) {
          _ignoreTime = false;
          var samedate = storingDateString[0];
          var querystring =
              'SELECT "time" FROM RememberLogin WHERE "deviceIdentifier" = '
                      "'" +
                  deviceIdentifier +
                  "'" ' AND "date" = ' "'" +
                  samedate +
                  "';";
          print("Query String: " + querystring);
          List<dynamic> results = await connection.query(querystring);
          results.forEach((row) {
            print("Database Result: " + row.toString());
            var rawtime =
                row.toString().substring(1, row.toString().length - 1);
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
              if (storingTime[x].compareTo(storingTime[x + 1]) < 0) {
                DateTime temp = storingTime[x];
                storingTime[x] = storingTime[x + 1];
                storingTime[x + 1] = temp;
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
      } else {
        _ignoreTime = true;
      }
      if (_ignoreTime == true) {
        querystring1 =
            'SELECT "username", "password" FROM RememberLogin WHERE "deviceIdentifier" = '
                    "'" +
                deviceIdentifier +
                "'" ' AND "date" = ' "'" +
                storingDateString[0] +
                "';";
      } else {
        var entrytime = storingTime[0].hour.toString().padLeft(2, '0') +
            storingTime[0].minute.toString().padLeft(2, '0') +
            storingTime[0].second.toString().padLeft(2, '0');
        querystring1 =
            'SELECT "username", "password" FROM RememberLogin WHERE "deviceIdentifier" = '
                    "'" +
                deviceIdentifier +
                "'" ' AND "date" = ' "'" +
                storingDateString[0] +
                "'" ' AND "time" = ' "'" +
                entrytime +
                "';";
      }
      print("Query String : " + querystring1);
      List<dynamic> results1 = await connection.query(querystring1);
      print("Database Result: " + results1.toString());
      var userpass = [];
      results1.forEach((row) {
        userpass.add(row);
      });
      connection.close();
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
      String locationEnd,
      String purposeOfTrip,
      String classType,
      String vcRankFullName) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'INSERT INTO Logging ("UUID", "username", "date", "vehicleNo", "timeStart", "odometerStart", "locationStart", "locationEnd", "purposeOfTrip", "classType", "vcRankFullName") ' +
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
            locationEnd +
            "','" +
            purposeOfTrip +
            "','" +
            classType +
            "','" +
            vcRankFullName +
            "');";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    // Get UUID to give Jovan
    var querystring2 =
        'SELECT "UUID" FROM logging WHERE "username"=' "'" + username + "' AND "'"date" = '"'" + date + "' AND "'"timeStart" = '"'" + timeStart + "';";
    print("Query String: " + querystring2);
    var results2 = await connection.query(querystring2);
    print("Database Result: " + results2.toString());
    //Get Current Date and NextWPTDate for Vehicle
    DateTime currentDateTime = DateTime.now();
    var now = DateTime.parse(currentDateTime.toString()+'-08:00');
    String lastWPTDate = now.day.toString().padLeft(2, '0') + "/" + now.month.toString().padLeft(2, '0') + "/" + now.year.toString();
    var nextWPTDateTime = now.add(Duration(days: 7));
    var nextWPTDate = nextWPTDateTime.day.toString().padLeft(2, '0') + "/" + nextWPTDateTime.month.toString().padLeft(2, '0') + "/" + nextWPTDateTime.year.toString();
    //Update Vehicle In use and WPT Dates
    var querystring3 =
        'UPDATE vehicles SET "inUse" = '"'true', "'"lastWPTDate" = '"'" + lastWPTDate + "', "'"nextWPTDate" = '"'" + nextWPTDate + "' WHERE "'"vehicleNo" = '"'" + vehicleNo + "';";
    print("Query String: " + querystring3);
    var results3 = await connection.query(querystring3);
    print("Database Result: " + results3.toString());
    //Update driver inUse to true
    var querystring4 =
        'UPDATE users SET "inUse" = '"'true' WHERE "'"username" = '"'" + username + "';";
    print("Query String: " + querystring4);
    var results4 = await connection.query(querystring4);
    print("Database Result: " + results4.toString());
    //Update Veh Com inUse to true
    if (vcRankFullName != ''){
      var vcFullName = vcRankFullName.substring(vcRankFullName.split(' ')[0].length);
      var querystring5 =
          'UPDATE users SET "inUse" = '"'true' WHERE "'"fullName" = '"'" + vcFullName + "';";
      print("Query String: " + querystring5);
      var results5 = await connection.query(querystring5);
      print("Database Result: " + results5.toString());
    }
    var rawValue = results2.toString();
    var value = rawValue.substring(2, rawValue.length - 2);
    connection.close();
    return value;
  }

  Future<void> endTrip(
      String UUID, String mileage, String timeEnd, String odometerEnd) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring4point5;
    var querystring5;
    var querystring = "UPDATE logging " +
        'SET "timeEnd" = ' "'" +
        timeEnd +
        "', " '"odometerEnd" = ' "'" +
        odometerEnd +
        "', " '"mileage" = ' "'" +
        mileage.toString() +
        "' WHERE " '"UUID" = '"'" +
        UUID +
        "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    //Get Vehicle Number and Class Type using UUID
    var querystring2 =
        'SELECT "vehicleNo", "classType" FROM logging WHERE "UUID"='"'" + UUID + "';";
    print("Query String: " + querystring2);
    var results2 = await connection.query(querystring2);
    print("Database Result: " + results2.toString()); // [[41556, 3]]
    var vehNo = results2.toString().split(',')[0].substring(2);
    var classType = results2.toString().split(',')[1].substring(1,2);
    // Set inUse to false for Vehicles
    var querystring3 =
        'UPDATE vehicles SET "inUse" = '"'false' WHERE "'"vehicleNo" = '"'" + vehNo + "';";
    print("Query String: " + querystring3);
    var results3 = await connection.query(querystring3);
    print("Database Result: " + results3.toString());
    //Get username from logging using UUID
    var querystring4 =
        'SELECT "username" FROM logging WHERE "UUID"='"'" + UUID + "';";
    print("Query String: " + querystring4);
    var results4 = await connection.query(querystring4);
    print("Database Result: " + results4.toString());
    var username = results4.toString().substring(2, results4.toString().length - 2);
    //Get old mileage from users using username
    if (classType == '3'){
      querystring4point5 =
          'SELECT "totalClass3Mileage" FROM logging WHERE "username"='"'" + username + "';";
    }
    else {
      querystring4point5 =
          'SELECT "totalClass4Mileage" FROM logging WHERE "username"='"'" + username + "';";
    }
    print("Query String: " + querystring4point5);
    var results4point5 = await connection.query(querystring4point5);
    print("Database Result: " + results4point5.toString());
    var oldMileage = results4point5.toString().substring(2, results4point5.toString().length - 2);
    //Update driver inUse to false and mileage update
    if (classType == '3'){
      querystring5 =
          'UPDATE users SET "inUse" = '"'false', "'"totalClass3Mileage" = '"'" + (int.parse(oldMileage)+int.parse(mileage)).toString() + "' WHERE "'"username" = '"'" + username + "';";
    }
    else {
      querystring5 =
          'UPDATE users SET "inUse" = '"'false', "'"totalClass4Mileage" = '"'" + (int.parse(oldMileage)+int.parse(mileage)).toString() + "' WHERE "'"username" = '"'" + username + "';";
    }
    print("Query String: " + querystring5);
    var results5 = await connection.query(querystring5);
    print("Database Result: " + results5.toString());
    //Get VC fullname from logging table
    var querystring6 =
        'SELECT "vcRankFullName" FROM logging WHERE "UUID"='"'" + UUID + "';";
    print("Query String: " + querystring6);
    var results6 = await connection.query(querystring6);
    print("Database Result: " + results6.toString());
    // if there is a Veh Com
    if (results6.toString() != "[[]]"){
      var vcRankFullName = results6.toString().substring(2, results6.toString().length - 2);
      //Update Veh Com inUse to false
      var vcFullName = vcRankFullName.substring(vcRankFullName.split(' ')[0].length);
      var querystring7 =
          'UPDATE users SET "inUse" = '"'false' WHERE "'"fullName" = '"'" + vcFullName + "';";
      print("Query String: " + querystring7);
      var results7 = await connection.query(querystring7);
      print("Database Result: " + results7.toString());
    }
    connection.close();
  }

  Future<bool> checkDataExist(String table, String column, String data) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = 'SELECT "' + column + '" FROM ' + table + ';';
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    var value = [];
    results.forEach((row) {
      value.add(row);
    });
    for (int i = 0; i < value.length; i++) {
      if ("[" + data + "]" == value[i].toString()) {
        connection.close();
        return true;
      }
    }
    connection.close();
    return false;
  }

  Future<List<dynamic>> multiDataPullColumn(String table, String column) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = 'SELECT "' + column + '" FROM ' + table + ';';
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    var value = [];
    results.forEach((rawRow) {
      var row = rawRow.toString().substring(1, rawRow.toString().length - 1);
      value.add(row);
    });
    connection.close();
    return value;
  }

  Future<List<dynamic>> multiDataPullRow(String table, String columnIdentifier,
      String columnIdentifierValue) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring = 'SELECT * FROM ' +
        table +
        ' WHERE "' +
        columnIdentifier +
        '" = ' "'" +
        columnIdentifierValue +
        "';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    String values =
        results.toString().substring(2, results.toString().length - 2);
    var trueresults = values.split(", ");
    connection.close();
    return trueresults;
  }

  Future<List<dynamic>> vehiclesBasedOnCarType(String carType) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "vehicleNo" FROM vehicles WHERE "carType" = ' "'" +
            carType +
            "' AND " + '"inUse" = ' + "'false';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    var value = [];
    results.forEach((rawRow) {
      var row = rawRow.toString().substring(1, rawRow.toString().length - 1);
      value.add(row);
    });
    connection.close();
    return value;
  }

  Future<List<List<dynamic>>> getMileageHistory(String username) async {
    var finallist = [[]];
    var count = 0;
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "vehicleNo", "date", "odometerStart", "odometerEnd", "mileage" FROM logging WHERE "username" = '"'" +
            username +
            "' AND " + '"mileage" != ' + "'';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    results.forEach((rawRow) {
      var row = rawRow.toString().substring(1, rawRow.toString().length - 1);
      var innerList = row.split(", ");
      finallist.add(innerList);
      count = count + 1;
    });
    finallist.removeAt(0);
    print("There are " + count.toString() + " mileage entries");
    connection.close();
    return finallist;
  }

  Future<List<String>> getAvailableVehCom() async {
    var finallist = [];
    var count = 0;
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "rank", "fullName" FROM users WHERE "inUse" = '"'false"';';
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    results.forEach((rawRow) {
      var row = rawRow.toString().substring(1, rawRow.toString().length - 1);
      var innerList = row.split(", ");
      var rankName = innerList[0] + " " + innerList[1];
      finallist.add(rankName);
      count = count + 1;
    });
    print("There are " + count.toString() + " available Vehicle Commanders");
    List<String> _returnList = finallist.map((string) => string.toString()).toList();
    connection.close();
    return _returnList;
  }

  Future<String> checkOngoingTrips(String username) async {
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var UUID = "";
    var querystring =
        'SELECT "UUID" FROM Users WHERE'" username = '" + username + "', "'"odometerEnd" = '"'';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    if (results.toString() == "[[]]"){
      UUID = results.toString().substring(2, results.toString().length - 2);
      print("You have an Ongoing Trip");
    }
    else {
      return "";
      print("No Ongoing Trips");
    }
    connection.close();
    return UUID;
  }

  Future<List<List<dynamic>>> getGreenFileData(String username) async {
    var finallist = [[]];
    var count = 0;
    var connection = new PostgreSQLConnection("116.89.31.147", 5667, "LTC",
        username: "LTCAppUser", password: "LTCuser123");
    await connection.open();
    var querystring =
        'SELECT "vehicleNo", "date", "odometerStart", "odometerEnd", "mileage", "classType" FROM logging WHERE "username" = '"'" +
            username +
            "' AND " + '"mileage" != ' + "'';";
    print("Query String: " + querystring);
    var results = await connection.query(querystring);
    print("Database Result: " + results.toString());
    results.forEach((rawRow) {
      var row = rawRow.toString().substring(1, rawRow.toString().length - 1);
      var innerList = row.split(", ");
      finallist.add(innerList);
      count = count + 1;
    });
    finallist.removeAt(0);
    print("There are " + count.toString() + " mileage entries");
    if (count == 1){
    }
    else if (count == 2){
      var dateX = finallist[0][1].split('/');
      var datetimeX = DateTime.utc(dateX[2],dateX[1],dateX[0]);
      var dateY = finallist[1][1].split('/');
      var datetimeY = DateTime.utc(dateY[2],dateY[1],dateY[0]);
      if (datetimeX.compareTo(datetimeY) > 0){
        var temp = finallist[0][1];
        finallist[0][1] = finallist[1][1];
        finallist[1][1] = temp;
      }
    }
    else{
      for (int x = 0; x < finallist.length - 1; x++){
        for (int y = 0; y < finallist.length - x - 1; y ++){
          var dateX = finallist[x][1].split('/');
          var datetimeX = DateTime.utc(dateX[2],dateX[1],dateX[0]);
          var dateY = finallist[x+1][1].split('/');
          var datetimeY = DateTime.utc(dateY[2],dateY[1],dateY[0]);
          if (datetimeX.compareTo(datetimeY) > 0){
            var temp = finallist[0][1];
            finallist[0][1] = finallist[1][1];
            finallist[1][1] = temp;
          }
        }
      }
    }
    connection.close();
    return finallist;
  }

}
