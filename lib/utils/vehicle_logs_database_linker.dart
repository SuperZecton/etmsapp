import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class VehLogInfoDatabaseHandler extends DatabaseHandler
{
  @override
  Future<void> databaseCreationOptimizer() async
  {
    dbPath = await getDatabasesPath();
    dbPath = join(dbPath, dbName);

    bool result = await databaseExists(dbPath);

    try {
      final Future<Database> database = openDatabase(
        dbPath,
        onCreate: (dbref, version) {
          return dbref.execute(
              "CREATE TABLE $dbTableName("
                  "dateOfMovement TEXT PRIMARY KEY, "
                  "midPlate TEXT, "
                  "vehType TEXT, "
                  "classType TEXT, "
                  "startingOdo TEXT, "
                  "endingOdo TEXT, "
                  "startingTime TEXT, "
                  "endingTime TEXT, "
                  "distanceCovered TEXT,"
                  "vehOperator TEXT,"
                  "vehCommander TEXT,"
                  "vehAuth TEXT"
                  ")"
          );
        },
        version: 1,
      );
    }
        catch(_)
    {

    }



    await getTableAsWhole();

    callConversion();
  }

  @override
  Future<void> buildBaseDBData() async
  {

  }
}