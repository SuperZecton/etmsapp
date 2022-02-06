import 'dart:async';
import 'package:path/path.dart';

class CarType
{
  final value;
  const CarType._internal(this.value);
  toString() => '$value';
  // TODO; Fill in with correct values
  static const GPCar = const CarType._internal("GP Car");
  static const Grade3 = const CarType._internal("Grade 3");
  static const Grade2 = const CarType._internal("Grade 2");
  static const Grade1 = const CarType._internal("Grade 1");
  static const MPV = const CarType._internal("MPV");
  static const MUV = const CarType._internal("MUV");
  static const CLR = const CarType._internal("CLR");
  static const OUV = const CarType._internal("OUV");

  static List<CarType> list = [GPCar, Grade3, Grade2, Grade1, MPV, MUV, CLR, OUV];
  static List<CarType> getValues() => list;
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

