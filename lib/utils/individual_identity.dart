import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'login_data_handler.dart';

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

class VocationType {

  final value;
  const VocationType._internal(this.value);
  toString() => 'VocationType.$value';

  static const TO = const VocationType._internal('Transport Operator');
  static const STO = const VocationType._internal('Storeman');
  static const TOA = const VocationType._internal('Transport Operator Assistant');
}

class VehLicenseType {

  final value;
  const VehLicenseType._internal(this.value);
  toString() => 'VehLicenseType.$value';

  static const class2 = const VehLicenseType._internal('Class 2');
  static const class2A = const VehLicenseType._internal('Class 2A');
  static const class3 = const VehLicenseType._internal('Class 3');
  static const class3A = const VehLicenseType._internal('Class 3A');
  static const class4 = const VehLicenseType._internal('Class 4');
}

class ClothesSizeType {
  final value;
  const ClothesSizeType._internal(this.value);
  toString() => 'ClothesSizeType.$value';

  static const XS = const ClothesSizeType._internal('XS');
  static const S = const ClothesSizeType._internal('S');
  static const M = const ClothesSizeType._internal('M');
  static const L = const ClothesSizeType._internal('L');
  static const XL =  const ClothesSizeType._internal('XL');
  static const XXL = const ClothesSizeType._internal('XXL');
  static const XXXL = const ClothesSizeType._internal('XXXL');
}

class BloodType {
  final value;
  const BloodType._internal(this.value);
  toString() => 'BloodType.$value';

  static const A_PLUS = const BloodType._internal('A+');
  static const A_MINUS = const BloodType._internal('A-');
  static const B_PLUS = const BloodType._internal('B+');
  static const B_MINUS = const BloodType._internal('B-');
  static const AB_PLUS = const BloodType._internal('AB+');
  static const AB_MINUS = const BloodType._internal('AB-');
  static const O_PLUS = const BloodType._internal('O+');
  static const O_MINUS = const BloodType._internal('O-');

}

class RaceType {
  final value;
  const RaceType._internal(this.value);
  toString() => 'RaceType.$value';

  static const Chinese = const RaceType._internal('Chinese');
  static const Malay = const RaceType._internal('Malay');
  static const Indian = const RaceType._internal('Indian');
  static const Eurasian = const RaceType._internal('Eurasian');
  static const Others = const RaceType._internal('Others');

}

class ReligionType {
  final value;
  const ReligionType._internal(this.value);
  toString() => 'ReligionType.$value';

  static const Christianity = const ReligionType._internal('Christian');
  static const Buddhism = const ReligionType._internal('Buddhism');
  static const Islam = const ReligionType._internal('Islam');
  static const Hindu = const ReligionType._internal('Hindu');
  static const Others = const ReligionType._internal('Others');

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
class PersonalDataSet {
  String fullName;
  String nricLast4Digits;
  String fullHomeAddress;
  String handphoneNumber;
  String homephoneNumber;
  DateTime dateOfBirth;
  DateTime dateOfEnlistment;
  DateTime dateOfORD;
  DateTime dateOfPostIn;
  String pes;
  ReligionType religion;
  RaceType race;
  String bloodGroup;
  String drugAllergy;
  String foodAllergy;
//  NOKDetailSet nokDetails;
  String NOKDetailfullName;
  String NOKDetailcontactNumber;
  String NOKDetailfullAddress;

  VocationType vocationType;
  String stayInstayOut;
  String medicalConditions;

  PersonalDataSet({this.fullName, this.nricLast4Digits, this.fullHomeAddress, this.handphoneNumber, this.homephoneNumber, this.dateOfBirth, this.dateOfEnlistment, this.dateOfORD, this.dateOfPostIn, this.pes, this.religion, this.race, this.bloodGroup, this.drugAllergy, this.foodAllergy, this.NOKDetailfullName, this.NOKDetailcontactNumber, this.NOKDetailfullAddress, this.vocationType, this.stayInstayOut, this.medicalConditions});
}

class TrainingDataSet {
  String trainingFrame;
  String trainingPeriod;
  int passAttempts;
  String militaryLicenseNo;
  VehLicenseType militaryLicenseType;
  DateTime milLicenseDateOfIssue;

  TrainingDataSet({this.trainingFrame, this.trainingPeriod, this.passAttempts, this.militaryLicenseNo, this.militaryLicenseType, this.milLicenseDateOfIssue});
}

class EducationDataSet {
  String educationLevel;
  String streamcourseName;
  String ccaOptional;

  EducationDataSet({this.educationLevel, this.streamcourseName, this.ccaOptional});
}

class MiscDataSet {
  String hobbiesInterest;
  VehLicenseType civillianLicenseType;
  String civillianLicenseNumber;
  DateTime civillianLicenseDateOfIssue;
  bool hasDoneDefensiveCourse;
  bool hasPersonalVehicle;
  String personalVehiclePlateNumber;
  ClothesSizeType tShirtSize;
  int no3sizeUpperTorso;
  int no3sizeWaist;
  int no3sizeShoes;

  MiscDataSet({this.hobbiesInterest, this.civillianLicenseType, this.civillianLicenseNumber, this.civillianLicenseDateOfIssue, this.hasDoneDefensiveCourse, this.hasPersonalVehicle, this.personalVehiclePlateNumber, this.tShirtSize, this.no3sizeUpperTorso, this.no3sizeWaist, this.no3sizeShoes});
}

class FullDetailSet {
  PersonalDataSet personalDataSet;
  TrainingDataSet trainingDataSet;
  EducationDataSet educationDataSet;
  MiscDataSet miscDataSet;

  LoginCredential loginCredentials;

  void sortPersonalData(String name, String nric, String homeAddress, String hpNo, String homeNo, DateTime dob, DateTime doe, DateTime ord, String pes, ReligionType religion, RaceType race, String bldGrp, String drugAlle, String foodAlle, String NOKname, String NOKadd, String NOKnum, VocationType vocType, String stayInOut, String medCond)
  {
    personalDataSet = new PersonalDataSet(fullName: name, nricLast4Digits: nric, fullHomeAddress: homeAddress, handphoneNumber: hpNo, homephoneNumber: homeNo, dateOfBirth: dob, dateOfEnlistment: doe, dateOfORD: ord, pes: pes, religion: religion, race: race, bloodGroup: bldGrp, drugAllergy: drugAlle, foodAllergy: foodAlle, NOKDetailfullName: NOKname, NOKDetailcontactNumber: NOKnum, NOKDetailfullAddress: NOKadd, vocationType: vocType, stayInstayOut: stayInOut, medicalConditions: medCond);
  }

  void sortTrainingData(String trngFrame, String trngPeriod, int attempts, String milLicenseNo, VehLicenseType milLicenseType, DateTime milLicenseDOI)
  {
    trainingDataSet = new TrainingDataSet(trainingFrame: trngFrame, trainingPeriod: trngPeriod, passAttempts: attempts, militaryLicenseNo: milLicenseNo, militaryLicenseType: milLicenseType, milLicenseDateOfIssue: milLicenseDOI);
  }

  void sortEducationData(String eduLvl, String strmCrseName, String cca)
  {
    educationDataSet = new EducationDataSet(educationLevel: eduLvl, streamcourseName: strmCrseName, ccaOptional: cca);
  }

  void sortMiscData(String hobbies, VehLicenseType civLicenseType, String civLicenseNo, DateTime civLicenseDOI, bool doneDefCourse, bool hasOwnVeh, String personalVehNo, ClothesSizeType tShirtSize, int upperTorsoSize, int waistSize, int shoeSize)
  {
    miscDataSet = new MiscDataSet(hobbiesInterest: hobbies, civillianLicenseType: civLicenseType, civillianLicenseNumber: civLicenseNo, civillianLicenseDateOfIssue: civLicenseDOI, hasDoneDefensiveCourse: doneDefCourse, hasPersonalVehicle: hasOwnVeh, personalVehiclePlateNumber: personalVehNo, tShirtSize: tShirtSize, no3sizeUpperTorso: upperTorsoSize, no3sizeWaist: waistSize, no3sizeShoes: shoeSize);
  }

  FullDetailSet({this.personalDataSet, this.trainingDataSet, this.educationDataSet, this.miscDataSet, this.loginCredentials});

  Map<String, dynamic> toMap()
  {
    return
      {
        /* Personal Section */
        'fullName': personalDataSet.fullName,
        'nricLast4Digits': personalDataSet.nricLast4Digits,
        'fullHomeAddress': personalDataSet.fullHomeAddress,
        'handphoneNumber': personalDataSet.handphoneNumber,
        'homephoneNumber': personalDataSet.homephoneNumber,
        'dateOfBirth': personalDataSet.dateOfBirth,
        'dateOfEnlistment': personalDataSet.dateOfEnlistment,
        'dateOfORD': personalDataSet.dateOfORD,
        'dateOfPostIn': personalDataSet.dateOfPostIn,
        'pesType': personalDataSet.pes,
        'religion': personalDataSet.religion,
        'race': personalDataSet.race,
        'bloodGroup': personalDataSet.bloodGroup,
        'drugAllergy': personalDataSet.drugAllergy,
        'foodAllergy': personalDataSet.foodAllergy,
        'NOKDetailfullName': personalDataSet.NOKDetailfullName,
        'NOKDetailcontactNumber': personalDataSet.NOKDetailcontactNumber,
        'NOKDetailfullAddress': personalDataSet.NOKDetailfullAddress,
        'vocationType': personalDataSet.vocationType,
        'stayInstayOut': personalDataSet.stayInstayOut,
        'medicalConditions': personalDataSet.medicalConditions,
        /* Training Section */
        'trainingFrame': trainingDataSet.trainingFrame,
        'trainingPeriod': trainingDataSet.trainingPeriod,
        'passAttempts': trainingDataSet.passAttempts,
        'militaryLicenseNo': trainingDataSet.militaryLicenseNo,
        'militaryLicenseType': trainingDataSet.militaryLicenseType,
        'milLicenseDateOfIssue': trainingDataSet.milLicenseDateOfIssue,
        /* Education Section */
        'educationLevel': educationDataSet.educationLevel,
        'streamcourseName': educationDataSet.streamcourseName,
        'ccaOptional': educationDataSet.ccaOptional,
        /* Others Section */
        'hobbiesInterest': miscDataSet.hobbiesInterest,
        'civillianLicenseType': miscDataSet.civillianLicenseType,
        'civillianLicenseNumber': miscDataSet.civillianLicenseNumber,
        'civillianLicenseDateOfIssue': miscDataSet.civillianLicenseDateOfIssue,
        'hasDoneDefensiveCourse': miscDataSet.hasDoneDefensiveCourse,
        'hasPersonalVehicle': miscDataSet.hasPersonalVehicle,
        'personalVehiclePlateNumber': miscDataSet.personalVehiclePlateNumber,
        'tShirtSize': miscDataSet.tShirtSize,
        'no3sizeUpperTorso': miscDataSet.no3sizeUpperTorso,
        'no3sizeWaist': miscDataSet.no3sizeWaist,
        'no3sizeShoes': miscDataSet.no3sizeShoes,

      };

  }
}