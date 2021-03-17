import 'package:ltcapp/utils/database_linker.dart';
import 'package:ltcapp/features/vehiclebookout/model/individual_vehicle.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class VehInfoDatabaseHandler extends DatabaseHandler
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
            // Veh Info Columns
                "midPlate TEXT PRIMARY KEY, "
                "vehType TEXT, "
                "classType TEXT, "
                "currentOdo TEXT"
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

  Future<void> insertNewRow(FullVehicleDetailSet dataSet) async
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

  Future<void> buildBaseDBData() async
  {
    var fVDS = new FullVehicleDetailSet();
    fVDS.sortData('MID50', VehType.AType.toString(), VehClassType.Class3.toString(), '696969');
    insertNewRow(fVDS);
  }
}