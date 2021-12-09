import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';

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
                  "midPlate TEXT PRIMARY KEY, "
                  "dateOfMovement TEXT, "
                  "vehType TEXT, "
                  "classType TEXT, "
                  "startingOdo TEXT, "
                  "endingOdo TEXT, "
                  "startingTime TEXT, "
                  "endingTime TEXT, "
                  "distanceCovered TEXT,"
                  "vehOperator TEXT,"
                  "vehCommander TEXT,"
                  "vehAuth TEXT, "
                  "destinationList TEXT"
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

  // TODO: Green File records to be used as calculator bonuses and more
  // TODO: Manual input for green file style logging
  // TODO: Checkpoint System for bonuses accrued across 2 years of cock service
}