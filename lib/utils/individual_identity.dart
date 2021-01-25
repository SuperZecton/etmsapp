import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'login_data_handler.dart';

/* Thought I had something with this
   I forgot enums were a thing
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


enum VehLicenseType {
  none,
  class2,
  class2A,
  class3,
  class3A,
  class4
}

enum ClothesSizeType {
  XS,
  S,
  M,
  L,
  XL
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

enum RaceType {
  Chinese,
  Malay,
  Indian,
  Eurasian,
  Other,

}

enum ReligionType {
  Christianity,
  Buddhism,
  Islam,
  Hindu,
  Other,

}



/*-----*/

class NOKDetailSet {
  String fullName;
  String contactNumber;
  String fullAddress;

  NOKDetailSet({this.fullName, this.contactNumber, this.fullAddress});
}

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
  NOKDetailSet nokDetails;
  VocationType vocationType;
  String stayInstayOut;
  String medicalConditions;

  PersonalDataSet({this.fullName, this.nricLast4Digits, this.fullHomeAddress, this.handphoneNumber, this.homephoneNumber, this.dateOfBirth, this.dateOfEnlistment, this.dateOfORD, this.dateOfPostIn, this.pes, this.religion, this.race, this.bloodGroup, this.drugAllergy, this.foodAllergy, this.nokDetails, this.vocationType, this.stayInstayOut, this.medicalConditions});
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

  FullDetailSet({this.personalDataSet, this.trainingDataSet, this.educationDataSet, this.miscDataSet, this.loginCredentials});

  void sortPersonalData(String name, String nric, String homeAddress, String hpNo, String homeNo, DateTime dob, DateTime doe, DateTime ord, String pes, ReligionType religion, RaceType race, String bldGrp, String drugAlle, String foodAlle, NOKDetailSet nokDetails, VocationType vocType, String stayInOut, String medCond)
  {
    personalDataSet = new PersonalDataSet(fullName: name, nricLast4Digits: nric, fullHomeAddress: homeAddress, handphoneNumber: hpNo, homephoneNumber: homeNo, dateOfBirth: dob, dateOfEnlistment: doe, dateOfORD: ord, pes: pes, religion: religion, race: race, bloodGroup: bldGrp, drugAllergy: drugAlle, foodAllergy: foodAlle, nokDetails: nokDetails, vocationType: vocType, stayInstayOut: stayInOut, medicalConditions: medCond);
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

}