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

enum VocationType {
  TO,
  STO,
  TOA
}

extension VocationTypeEx on VocationType{
  String get name {
    switch (this)
    {
      case VocationType.TO:
        return 'Transport Operator';
      case VocationType.STO:
        return 'Storeman';
      case VocationType.TOA:
        return 'Transport Operator Assistant';
      default:
        return null;
    }
  }
}

enum VehLicenseType {
  class2,
  class2A,
  class3,
  class3A,
  class4
}

extension VehLicenseTypeEx on VehLicenseType{
String get name {
  switch (this)
  {
    case VehLicenseType.class2:
      return 'Class 2';
    case VehLicenseType.class2A:
      return 'Class 2A';
    case VehLicenseType.class3:
      return 'Class 3';
    case VehLicenseType.class3A:
      return 'Class 3A';
    case VehLicenseType.class4:
      return 'Class 4';
    default:
      return "None";
  }
}
}

enum ClothesSizeType {
  XS,
  S,
  M,
  L,
  XL,
  XXL,
  XXXL
}

extension ClothesSizeTypeEx on ClothesSizeType{
String get name {
  switch (this)
  {
    case ClothesSizeType.XS:
      return 'XS';
    case ClothesSizeType.S:
      return 'S';
    case ClothesSizeType.M:
      return 'M';
    case ClothesSizeType.L:
      return 'L';
    case ClothesSizeType.XL:
      return 'XL';
    case ClothesSizeType.XXL:
      return 'XXL';
    case ClothesSizeType.XXXL:
      return 'XXXL';
    default:
      return null;
  }
}
}

enum BloodType {
  A_PLUS,
  A_MINUS,
  B_PLUS,
  B_MINUS,
  AB_PLUS,
  AB_MINUS,
  O_PLUS,
  O_MINUS,

}

extension BloodTypeEx on BloodType{
String get name {
  switch (this)
  {
    case BloodType.A_MINUS:
      return 'A-';
    case BloodType.A_PLUS:
      return 'A+';
    case BloodType.B_PLUS:
      return 'B+';
    case BloodType.B_MINUS:
      return 'B-';
    case BloodType.AB_PLUS:
      return 'AB+';
    case BloodType.AB_MINUS:
      return 'AB-';
    case BloodType.O_PLUS:
      return 'O+';
    case BloodType.O_MINUS:
      return 'O-';
    default:
      return 'Some kind of demon';
  }
}
}

enum RaceType {
  Chinese,
  Malay,
  Indian,
  Eurasian

}

extension RaceTypeEx on RaceType{
  String get name {
    switch (this)
    {
      case RaceType.Chinese:
        return 'Chinese';
      case RaceType.Malay:
        return 'Malay';
      case RaceType.Indian:
        return 'Indian';
      case RaceType.Eurasian:
        return 'Eurasian';
      default:
        return 'Other';
    }
  }
}

enum ReligionType {
  Christianity,
  Buddhism,
  Islam,
  Hindu

}

extension ReligionTypeEx on ReligionType{
  String get name {
    switch (this)
    {
      case ReligionType.Christianity:
        return 'Christian';
      case ReligionType.Buddhism:
        return 'Buddhism';
      case ReligionType.Islam:
        return 'Islam';
      case ReligionType.Hindu:
        return 'Hindu';
      default:
        return 'Others';
    }
  }
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