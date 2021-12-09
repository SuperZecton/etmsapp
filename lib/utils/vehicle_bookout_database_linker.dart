import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';

class VehBookoutDatabaseHandler extends DatabaseHandler {
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
                // Columns
                    "midPlate TEXT PRIMARY KEY, "
                    "keyBunchNo TEXT, "
                    "keyNo TEXT, "
                    "vehOperator TEXT, "
                    "bookoutTime TEXT,"
                    "bookoutDate TEXT,  "
                    "authOutPerson TEXT, "
                    "bookInTime TEXT, "
                    "bookInDate TEXT, "
                    "authInPerson TEXT, "
                    "remarks TEXT"
                    ")"
            );
          });
    }
    catch (_) {

    }

    await getTableAsWhole();
    callConversion();
  }

  @override
  Future<void> buildBaseDBData() async
  {

  }
}