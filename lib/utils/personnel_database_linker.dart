import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
//import 'package:dart_mssql/dart_mssql.dart';
import 'package:mysql1/mysql1.dart';

class PersonnelDatabaseHandler extends DatabaseHandler
{

  // Local DB Creation and management
  @override
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

  Future<void> insertNewRow(FullDetailSet dataSet) async
  {
    switch (mySQLConnectionInstance)
    {
      case null:
        {
          if (db == null)
          {
            return null;
          }

          if (dataSet == null)
          {
            return null;
          }

          final Database cachedDB = await db;

          await cachedDB.insert(dbTableName, dataSet.toMap(), conflictAlgorithm: ConflictAlgorithm.ignore);
        }
        break;
      default:
        {


          var result = await mySQLConnectionInstance.query(''
              'INSERT into $mySQLTableName '
              '('
              'UUID, '
              'fullName, '
              'nricLast4Digits, '
              'fullHomeAddress, '
              'handphoneNumber, '
              'homephoneNumber, '
              'dateOfBirth, '
              'dateOfEnlistment, '
              'dateOfORD, '
              'dateOfPostIn, '
              'pesType, '
              'religion, '
              'race, '
              'bloodGroup, '
              'drugAllergy, '
              'foodAllergy, '
              'NOKDetailfullName, '
              'NOKDetailcontactNumber, '
              'NOKDetailfullAddress, '
              'vocationType, '
              'stayInstayOut, '
              'medicalConditions, '
              'trainingFrame, '
              'trainingPeriod, '
              'passAttempts, '
              'militaryLicenseNo, '
              'militaryLicenseType, '
              'milLicenseDateOfIssue, '
              'educationLevel, '
              'streamcourseName, '
              'ccaOptional, '
              'schName, '
              'hobbiesInterest, '
              'civillianLicenseType, '
              'civillianLicenseNumber, '
              'civillianLicenseDateOfIssue, '
              'hasDoneDefensiveCourse, '
              'hasPersonalVehicle, '
              'personalVehiclePlateNumber, '
              'tShirtSize, '
              'no3sizeUpperTorso, '
              'no3sizeWaist, '
              'no3sizeShoes, '
              'username, '
              'password'
              ') value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
              '', ['0',
            dataSet.personalDataSet.fullName,
            dataSet.personalDataSet.nricLast4Digits,
            dataSet.personalDataSet.handphoneNumber,
            dataSet.personalDataSet.homephoneNumber,
            dataSet.personalDataSet.dateOfBirth,
            dataSet.personalDataSet.dateOfEnlistment,
            dataSet.personalDataSet.dateOfORD,
            dataSet.personalDataSet.dateOfPostIn,
            dataSet.personalDataSet.pes,
            dataSet.personalDataSet.religion,
            dataSet.personalDataSet.race,
            dataSet.personalDataSet.bloodGroup,
            dataSet.personalDataSet.drugAllergy,
            dataSet.personalDataSet.foodAllergy,
            dataSet.personalDataSet.NOKDetailfullName,
            dataSet.personalDataSet.NOKDetailfullAddress,
            dataSet.personalDataSet.NOKDetailcontactNumber,
            dataSet.personalDataSet.vocationType,
            dataSet.personalDataSet.stayInstayOut,
            dataSet.trainingDataSet.trainingFrame,
            dataSet.trainingDataSet.trainingPeriod,
            dataSet.trainingDataSet.passAttempts,
            dataSet.trainingDataSet.militaryLicenseNo,
            dataSet.trainingDataSet.militaryLicenseType,
            dataSet.trainingDataSet.milLicenseDateOfIssue,
            dataSet.educationDataSet.educationLevel,
            dataSet.educationDataSet.streamcourseName,
            dataSet.educationDataSet.ccaOptional,
            dataSet.educationDataSet.schName,
            dataSet.miscDataSet.hobbiesInterest,
            dataSet.miscDataSet.civillianLicenseType,
            dataSet.miscDataSet.civillianLicenseNumber,
            dataSet.miscDataSet.civillianLicenseDateOfIssue,
            dataSet.miscDataSet.hasDoneDefensiveCourse,
            dataSet.miscDataSet.hasPersonalVehicle,
            dataSet.miscDataSet.personalVehiclePlateNumber,
            dataSet.miscDataSet.personalVehiclePlateNumber,
            dataSet.miscDataSet.tShirtSize,
            dataSet.miscDataSet.no3sizeUpperTorso,
            dataSet.miscDataSet.no3sizeWaist,
            dataSet.miscDataSet.no3sizeShoes,
            dataSet.loginCredentials.username,
            dataSet.loginCredentials.password]);
        }
        break;
    }


  }

  Future<bool> verifyLoginCreds(String email, String pass) async
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

  }

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

  @override
  Future<void> buildMySQLDBData() async
  {

  }

  Future<List<Map>> getFullRowFromEmail(String email) async
  {
    switch (mySQLConnectionInstance)
    {
      case null: // No connection established
        {
          final Database database = await db;

          try {
            /*     var result = await database.rawQuery(""
          "SELECT * "
          "FROM $dbTableName "
          "WHERE email=? "
          "", [email]);
          */

            var result = await getLocalColumnInRowData("email", email);
            // await setColumnInRowData("fullName", targetRow, targetRowData, updateData)
            return result;
          }
          catch (_) {

          }
        }
        break;
      default: // Connection established
        {



    //        return results;
        }
        break;
    }


    return null;
  }

}