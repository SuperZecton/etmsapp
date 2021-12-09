import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';

class PersonnelBookoutDataHandler extends DatabaseHandler{
  @override
  Future<void> databaseCreationOptimzer() async
  {
    dbPath = await getDatabasesPath();
    dbPath = join(dbPath, dbName);
    
    try {
      final Future<Database> database = openDatabase(
          dbPath,
          onCreate: (dbref, version) {
            return dbref.execute(
                "CREATE TABLE $dbTableName("
                    "fullName TEXT PRIMARY KEY, "
                    "bookInDate TEXT, "
                    "bookInTime TEXT, "
                    "selfInAuth TEXT, "
                    "bookOutDate TEXT, "
                    "bookOutTime TEXT, "
                    "selfOutAuth TEXT"
                    ")");
          });
    }
    catch(_) {
      
    }

    await getDatabasesPath();
    callConversion();
  }

  @override
  Future<void> buildBaseDBData() async
  {

  }
}