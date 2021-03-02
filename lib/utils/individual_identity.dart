
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ltcapp/utils/login_data_handler.dart';


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
  toString() => '$value';

  static const TO = const VocationType._internal('Transport Operator');
  static const STO = const VocationType._internal('Storeman');
  static const TOA = const VocationType._internal('Transport Operator Assistant');
  static const OTHERS = const VocationType._internal('Others');

  static List<VocationType> list = [TO,STO,TOA,OTHERS];
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
  static const XL =  const ClothesSizeType._internal('XL');
  static const XXL = const ClothesSizeType._internal('XXL');
  static const XXXL = const ClothesSizeType._internal('XXXL');

  static List<ClothesSizeType> list = [XS,S,M,L,XL,XXL,XXXL];
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
  static List<PESType> list = [A,B1,B2,B3,B4,C2,C9,E1,E9,F];
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

  static List<RaceType> list = [Chinese,Malay,Indian,Eurasian,Others];
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

  static List<ReligionType> list = [Christianity,Buddhism,Islam,Hindu,Others];
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
  static List<BloodType> list = [A_PLUS,A_MINUS,B_PLUS,B_MINUS,AB_PLUS,AB_MINUS,O_PLUS,O_MINUS];
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
  static List<TrueOrFalseType> list = [True,False];
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
class PersonalDataSet {
  String fullName;
  String nricLast4Digits;
  String fullHomeAddress;
  String handphoneNumber;
  String homephoneNumber;
  String dateOfBirth;
  String dateOfEnlistment;
  String dateOfORD;
  String dateOfPostIn;
  String pes;
  String religion;
  String race;
  String bloodGroup;
  String drugAllergy;
  String foodAllergy;
//  NOKDetailSet nokDetails;
  String NOKDetailfullName;
  String NOKDetailcontactNumber;
  String NOKDetailfullAddress;

  String vocationType;
  String stayInstayOut;
  String medicalConditions;

  PersonalDataSet({this.fullName, this.nricLast4Digits, this.fullHomeAddress, this.handphoneNumber, this.homephoneNumber, this.dateOfBirth, this.dateOfEnlistment, this.dateOfORD, this.dateOfPostIn, this.pes, this.religion, this.race, this.bloodGroup, this.drugAllergy, this.foodAllergy, this.NOKDetailfullName, this.NOKDetailcontactNumber, this.NOKDetailfullAddress, this.vocationType, this.stayInstayOut, this.medicalConditions});
}

class TrainingDataSet {
  String trainingFrame;
  String trainingPeriod;
  int passAttempts;
  String militaryLicenseNo;
  String militaryLicenseType;
  String milLicenseDateOfIssue;

  TrainingDataSet({this.trainingFrame, this.trainingPeriod, this.passAttempts, this.militaryLicenseNo, this.militaryLicenseType, this.milLicenseDateOfIssue});
}

class EducationDataSet {
  String educationLevel;
  String streamcourseName;
  String ccaOptional;
  String schName;

  EducationDataSet({this.educationLevel, this.streamcourseName, this.ccaOptional, this.schName});
}

class MiscDataSet {
  String hobbiesInterest;
  String civillianLicenseType;
  String civillianLicenseNumber;
  String civillianLicenseDateOfIssue;
  String hasDoneDefensiveCourse;
  String hasPersonalVehicle;
  String personalVehiclePlateNumber;
  String tShirtSize;
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

  void sortPersonalData(String name, String nric, String homeAddress, String hpNo, String homeNo, String dob, String doe, String ord, String postIn, String pes, String religion, String race, String bldGrp, String drugAlle, String foodAlle, String NOKname, String NOKadd, String NOKnum, String vocType, String stayInOut, String medCond)
  {
    personalDataSet = new PersonalDataSet(fullName: name, nricLast4Digits: nric, fullHomeAddress: homeAddress, handphoneNumber: hpNo, homephoneNumber: homeNo, dateOfBirth: dob, dateOfEnlistment: doe, dateOfORD: ord, dateOfPostIn: postIn, pes: pes, religion: religion, race: race, bloodGroup: bldGrp, drugAllergy: drugAlle, foodAllergy: foodAlle, NOKDetailfullName: NOKname, NOKDetailcontactNumber: NOKnum, NOKDetailfullAddress: NOKadd, vocationType: vocType, stayInstayOut: stayInOut, medicalConditions: medCond);
  }
 /*
  void sortPersonalData(PersonalDataSet pDS)
  {
    personalDataSet = pDS;
  }
*/
  void sortTrainingData(String trngFrame, String trngPeriod, int attempts, String milLicenseNo, String milLicenseType, String milLicenseDOI)
  {
    trainingDataSet = new TrainingDataSet(trainingFrame: trngFrame, trainingPeriod: trngPeriod, passAttempts: attempts, militaryLicenseNo: milLicenseNo, militaryLicenseType: milLicenseType, milLicenseDateOfIssue: milLicenseDOI);
  }

  void sortEducationData(String eduLvl, String strmCrseName, String cca, String sch)
  {
    educationDataSet = new EducationDataSet(educationLevel: eduLvl, streamcourseName: strmCrseName, ccaOptional: cca, schName: sch);
  }

  void sortMiscData(String hobbies, String civLicenseType, String civLicenseNo, String civLicenseDOI, String doneDefCourse, String hasOwnVeh, String personalVehNo, String tShirtSize, int upperTorsoSize, int waistSize, int shoeSize)
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
        'schName': educationDataSet.schName,
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
        /* Login Creds Section */
        'email': loginCredentials.username,
        'password': loginCredentials.password
      };

  }
}