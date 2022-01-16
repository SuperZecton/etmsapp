import 'dart:async';
import 'package:path/path.dart';

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

