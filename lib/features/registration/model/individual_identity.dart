import 'dart:async';
import 'package:path/path.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:meta/meta.dart';

/* Thought I had something with this
   I forgot enums were a thing
   Also enums here SUCK
class CitizenshipType {
  final singaporeanBorn;
  final singaporeanByReg;
  final permanentResident;

  const CitizenshipType(this.singaporeanBorn, this.singaporeanByReg, this.permanentResident);
}
*/

class RankType {
  final value;
  const RankType._internal(this.value);
  toString() => '$value';

  static const PTE = const RankType._internal('PTE');
  static const LCP = const RankType._internal('LCP');
  static const CPL = const RankType._internal('CPL');
  static const CFC = const RankType._internal('CFC');
  static const SGT3 = const RankType._internal('3SG');
  static const SGT2 = const RankType._internal('2SG');
  static const SGT1 = const RankType._internal('1SG');
  static const SSG = const RankType._internal('SSG');
  static const MSG = const RankType._internal('MSG');
  static const WO3 = const RankType._internal('3WO');
  static const WO2 = const RankType._internal('2WO');
  static const WO1 = const RankType._internal('1WO');
  static const MWO = const RankType._internal('MWO');
  static const DX6 = const RankType._internal('DX06');
  static const DX7 = const RankType._internal('DX07');
  static const DX8 = const RankType._internal('DX08');
  static const DX9 = const RankType._internal('DX09');

  static const OTHERS = const VocationType._internal('Others');

  static List<RankType> list = [
    PTE,
    LCP,
    CPL,
    CFC,
    SGT3,
    SGT2,
    SGT1,
    SSG,
    MSG,
    WO3,
    WO2,
    WO1,
    MWO,
    DX6,
    DX7,
    DX8,
    DX9
  ];
  static List<RankType> getValues() => list;
}

class VocationType {
  final value;
  const VocationType._internal(this.value);
  toString() => '$value';

  static const TO = const VocationType._internal('Transport Operator');
  static const STO = const VocationType._internal('Transport Operator Support');
  static const TOA =
      const VocationType._internal('Transport Operator Assistant');
  static const TOB = const VocationType._internal('Transport Operator Base');
  static const OTHERS = const VocationType._internal('Others');

  static List<VocationType> list = [TO, STO, TOA, TOB, OTHERS];
  static List<VocationType> getValues() => list;
}

class VehLicenseType {
  final value;
  const VehLicenseType._internal(this.value);
  toString() => '$value';

  static const class2 = const VehLicenseType._internal('Class 2');
  static const class2A = const VehLicenseType._internal('Class 2A');
  static const class3 = const VehLicenseType._internal('Class 3');
  static const class3A = const VehLicenseType._internal('Class 3A');
  static const class4 = const VehLicenseType._internal('Class 4');

  static List<VehLicenseType> list = [class2, class2A, class3, class3A, class4];
  static List<VehLicenseType> getValues() => list;
}

class ClothesSizeType {
  final value;
  const ClothesSizeType._internal(this.value);
  toString() => '$value';

  static const XS = const ClothesSizeType._internal('XS');
  static const S = const ClothesSizeType._internal('S');
  static const M = const ClothesSizeType._internal('M');
  static const L = const ClothesSizeType._internal('L');
  static const XL = const ClothesSizeType._internal('XL');
  static const XXL = const ClothesSizeType._internal('XXL');
  static const XXXL = const ClothesSizeType._internal('XXXL');

  static List<ClothesSizeType> list = [XS, S, M, L, XL, XXL, XXXL];
  static List<ClothesSizeType> getValues() => list;
}

class PESType {
  final value;
  const PESType._internal(this.value);
  toString() => '$value';

  static const A = const PESType._internal('A');
  static const B1 = const PESType._internal('B1');
  static const B2 = const PESType._internal('B2');
  static const B3 = const PESType._internal('B3');
  static const B4 = const PESType._internal('B4');
  static const C2 = const PESType._internal('C2');
  static const C9 = const PESType._internal('C9');
  static const E1 = const PESType._internal('E1');
  static const E9 = const PESType._internal('E9');
  static const F = const PESType._internal('F');
  static List<PESType> list = [A, B1, B2, B3, B4, C2, C9, E1, E9, F];
  static List<PESType> getValues() => list;
}

class RaceType {
  final value;
  const RaceType._internal(this.value);
  toString() => '$value';

  static const Chinese = const RaceType._internal('Chinese');
  static const Malay = const RaceType._internal('Malay');
  static const Indian = const RaceType._internal('Indian');
  static const Eurasian = const RaceType._internal('Eurasian');
  static const Others = const RaceType._internal('Others');

  static List<RaceType> list = [Chinese, Malay, Indian, Eurasian, Others];
  static List<RaceType> getValues() => list;
}

class ReligionType {
  final value;
  const ReligionType._internal(this.value);
  toString() => '$value';

  static const Christianity = const ReligionType._internal('Christian');
  static const Buddhism = const ReligionType._internal('Buddhism');
  static const Islam = const ReligionType._internal('Islam');
  static const Hindu = const ReligionType._internal('Hindu');
  static const Others = const ReligionType._internal('Others');

  static List<ReligionType> list = [
    Christianity,
    Buddhism,
    Islam,
    Hindu,
    Others
  ];
  static List<ReligionType> getValues() => list;
}

class BloodType {
  final value;
  const BloodType._internal(this.value);
  toString() => '$value';

  static const A_PLUS = const BloodType._internal('A+');
  static const A_MINUS = const BloodType._internal('A-');
  static const B_PLUS = const BloodType._internal('B+');
  static const B_MINUS = const BloodType._internal('B-');
  static const AB_PLUS = const BloodType._internal('AB+');
  static const AB_MINUS = const BloodType._internal('AB-');
  static const O_PLUS = const BloodType._internal('O+');
  static const O_MINUS = const BloodType._internal('O-');
  static List<BloodType> list = [
    A_PLUS,
    A_MINUS,
    B_PLUS,
    B_MINUS,
    AB_PLUS,
    AB_MINUS,
    O_PLUS,
    O_MINUS
  ];
  static List<BloodType> getValues() => list;
}

class StayInStayOutType {
  final value;
  const StayInStayOutType._internal(this.value);
  toString() => '$value';

  static const STAYIN = const StayInStayOutType._internal('Stay in');
  static const STAYOUT = const StayInStayOutType._internal('Stay out');
  static List<StayInStayOutType> list = [STAYIN, STAYOUT];
  static List<StayInStayOutType> getValues() => list;
}

class TrueOrFalseType {
  final value;
  const TrueOrFalseType._internal(this.value);
  toString() => '$value';

  static const True = const TrueOrFalseType._internal('Yes');
  static const False = const TrueOrFalseType._internal('No');
  static List<TrueOrFalseType> list = [True, False];
  static List<TrueOrFalseType> getValues() => list;
}

/*-----*/
/*
class NOKDetailSet {
  String fullName;
  String contactNumber;
  String fullAddress;

  NOKDetailSet({this.fullName, this.contactNumber, this.fullAddress});
}
*/
// Currently split to make things easier to read when all the data comes pouring in
