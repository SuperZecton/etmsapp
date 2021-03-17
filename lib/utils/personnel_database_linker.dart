import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/features/login/model/login_credentials.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class PersonnelDatabaseHandler extends DatabaseHandler
{
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
                  "email TEXT, "
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

    callConversion();
  }

  Future<void> insertNewRow(FullDetailSet dataSet) async
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

  Future<bool> verifyLoginCreds(String email, String pass) async
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
    List<Map> result;
    try
    {
       result = await database.rawQuery(
          'SELECT password FROM $dbTableName WHERE email=?', [email]);
      // TODO: Get password from result to return for login authorization
      String checker = result.toString();
      print("This is the current response from the password query: " + checker);


      return checker.contains(pass);
    }
    catch (_)
    {
      print("Table name invalid. $dbTableName not found.");
      return false;
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

}