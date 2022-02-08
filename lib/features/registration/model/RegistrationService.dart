class RegistrationService {
  static final RegistrationService _currentRegistration =
      RegistrationService._internal();
  RegistrationService._internal();
  factory RegistrationService({
    String? currentRankValue,
    String? name,
    String? username,
    String? nric,
    String? password,
    String? address,
    String? number,
    String? homeNumber,
    String? email,
    String? dob,
    String? doe,
    String? ord,
    String? dop,
    String? currentPESValue,
    String? currentReligionValue,
    String? currentRaceValue,
    String? currentBloodValue,
    String? drugAllergy,
    String? foodAllergy,
    String? nok,
    String? nokNumber,
    String? nokAddress,
    String? currentVocationValue,
    String? medicalCondition,
    String? trgFrame,
    String? trgPeriod,
    String? noAttempts,
    String? militaryLicense,
    String? militaryLicenseType,
    String? doi,
    String? educationLevel,
    String? streamCourse,
    String? cca,
    String? school,
    String? hobbies,
    String? civilianLicense,
    String? civilianLicenseNo,
    String? civilianLicenseDOI,
    String? personalVehicle,
  }) =>
      _currentRegistration;
  static RegistrationService get instance => _currentRegistration;

  String? currentRankValue;
  String? name;
  String? username;
  String? nric;
  String? password;
  String? address;
  String? number;
  String? homeNumber;
  String? email;
  String? dob;
  String? doe;
  String? ord;
  String? dop;
  String? currentPESValue;
  String? currentReligionValue;
  String? currentRaceValue;
  String? currentBloodValue;
  String? drugAllergy;
  String? foodAllergy;
  String? nok;
  String? nokNumber;
  String? nokAddress;
  String? currentVocationValue;
  String? medicalCondition;


  ///Trg
  String? trgFrame;
  String? trgPeriod;
  String? noAttempts;
  String? militaryLicense;
  String? militaryLicenseType;
  String? doi;
  ///Education
  String? educationLevel;
  String? streamCourse;
  String? cca;
  String? school;
  ///Other
  String? hobbies;
  String? civilianLicense;
  String? civilianLicenseNo;
  String? civilianLicenseDOI;
  String? personalVehicle;

}
