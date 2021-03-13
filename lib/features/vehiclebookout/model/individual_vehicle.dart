import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VehType
{
  final value;
  const VehType._internal(this.value);
  toString() => '$value';
  // TODO; Fill in with correct values
  static const AType = const VehType._internal("A Type");
  static const BType = const VehType._internal("B Type");

  static List<VehType> list = [AType, BType];
  static List<VehType> getValues() => list;
}

class VehClassType
{
  final value;
  const VehClassType._internal(this.value);
  toString() => '$value';
  // TODO; Fill in with correct values
  static const Class3 = const VehClassType._internal("Class 3");
  static const Class4 = const VehClassType._internal("Class 4");

  static List<VehClassType> list = [Class3, Class4];
  static List<VehClassType> getValues() => list;
}

class FullVehicleDetailSet
{
  String midPlateNo;
  String vehType;
  String vehClassType;
  String currentOdo;

  void sortData(String mid, String vehT, String vehCT, String cOdo)
  {
    midPlateNo = mid;
    vehType = vehT;
    vehClassType = vehCT;
    currentOdo = cOdo;
  }

  FullVehicleDetailSet({this.midPlateNo, this.vehType, this.vehClassType, this.currentOdo});

  Map<String, dynamic> toMap()
  {
    return
        {
          'midPlate': midPlateNo,
          'vehType': vehType,
          'classType': vehClassType,
          'currentOdo': currentOdo
        };
  }
}