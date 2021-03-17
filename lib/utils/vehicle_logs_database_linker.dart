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

    try
        {

        }
        catch(_)
    {

    }

    await getTableAsWhole();

    callConversion();
  }
}