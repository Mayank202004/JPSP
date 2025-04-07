class ProfileModel {
  PersonalDetails? personalDetails;
  IncomeDetails? incomeDetails;
  DomicileDetails? domicileDetails;
  BankDetails? bankDetails;
  Address? address;
  ParentsDetails? parentsDetails;
  HostelDetails? hostelDetails;
  List<CurrentQualification>? currentQualification;
  bool? isAddressFilled;
  bool? isBankDetailsFilled;
  bool? isCurrentQualificationsFilled;
  bool? isDomicileDetailsFilled;
  bool? isHostelDetailsFilled;
  bool? isIncomeDetailsFilled;
  bool? isParentsDetailsFilled;
  bool? isPastQualificationsFilled;
  bool? isPersonalDetailsFilled;
  List<PastQualifications>? pastQualifications;

  ProfileModel(
      {this.personalDetails,
        this.incomeDetails,
        this.domicileDetails,
        this.bankDetails,
        this.address,
        this.parentsDetails,
        this.hostelDetails,
        this.currentQualification,
        this.isAddressFilled,
        this.isBankDetailsFilled,
        this.isCurrentQualificationsFilled,
        this.isDomicileDetailsFilled,
        this.isHostelDetailsFilled,
        this.isIncomeDetailsFilled,
        this.isParentsDetailsFilled,
        this.isPastQualificationsFilled,
        this.isPersonalDetailsFilled,
        this.pastQualifications});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    personalDetails = json['personalDetails'] != null
        ? PersonalDetails.fromJson(json['personalDetails'])
        : null;
    incomeDetails = json['incomeDetails'] != null
        ? IncomeDetails.fromJson(json['incomeDetails'])
        : null;
    domicileDetails = json['domicileDetails'] != null
        ? DomicileDetails.fromJson(json['domicileDetails'])
        : null;
    bankDetails = json['bankDetails'] != null
        ? BankDetails.fromJson(json['bankDetails'])
        : null;
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    parentsDetails = json['parentsDetails'] != null
        ? ParentsDetails.fromJson(json['parentsDetails'])
        : null;
    hostelDetails = json['hostelDetails'] != null
        ? HostelDetails.fromJson(json['hostelDetails'])
        : null;
    if (json['currentQualification'] != null) {
      currentQualification = <CurrentQualification>[];
      json['currentQualification'].forEach((v) {
        currentQualification!.add(CurrentQualification.fromJson(v));
      });
    }
    isAddressFilled = json['isAddressFilled'];
    isBankDetailsFilled = json['isBankDetailsFilled'];
    isCurrentQualificationsFilled = json['isCurrentQualificationsFilled'];
    isDomicileDetailsFilled = json['isDomicileDetailsFilled'];
    isHostelDetailsFilled = json['isHostelDetailsFilled'];
    isIncomeDetailsFilled = json['isIncomeDetailsFilled'];
    isParentsDetailsFilled = json['isParentsDetailsFilled'];
    isPastQualificationsFilled = json['isPastQualificationsFilled'];
    isPersonalDetailsFilled = json['isPersonalDetailsFilled'];
    if (json['pastQualifications'] != null) {
      pastQualifications = <PastQualifications>[];
      json['pastQualifications'].forEach((v) {
        pastQualifications!.add(PastQualifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (personalDetails != null) {
      data['personalDetails'] = personalDetails!.toJson();
    }
    if (incomeDetails != null) {
      data['incomeDetails'] = incomeDetails!.toJson();
    }
    if (domicileDetails != null) {
      data['domicileDetails'] = domicileDetails!.toJson();
    }
    if (bankDetails != null) {
      data['bankDetails'] = bankDetails!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (parentsDetails != null) {
      data['parentsDetails'] = parentsDetails!.toJson();
    }
    if (hostelDetails != null) {
      data['hostelDetails'] = hostelDetails!.toJson();
    }
    if (currentQualification != null) {
      data['currentQualification'] =
          currentQualification!.map((v) => v.toJson()).toList();
    }
    data['isAddressFilled'] = isAddressFilled;
    data['isBankDetailsFilled'] = isBankDetailsFilled;
    data['isCurrentQualificationsFilled'] = isCurrentQualificationsFilled;
    data['isDomicileDetailsFilled'] = isDomicileDetailsFilled;
    data['isHostelDetailsFilled'] = isHostelDetailsFilled;
    data['isIncomeDetailsFilled'] = isIncomeDetailsFilled;
    data['isParentsDetailsFilled'] = isParentsDetailsFilled;
    data['isPastQualificationsFilled'] = isPastQualificationsFilled;
    data['isPersonalDetailsFilled'] = isPersonalDetailsFilled;
    if (pastQualifications != null) {
      data['pastQualifications'] =
          pastQualifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalDetails {
  String? fullName;
  String? dob;
  int? age;
  String? aadharNumber;
  String? aadharCard;
  String? mobile;
  String? gender;
  String? parentMobile;
  String? maritalStatus;
  String? religion;
  String? casteCategory;
  String? email;

  PersonalDetails(
      {this.fullName,
        this.dob,
        this.age,
        this.aadharNumber,
        this.aadharCard,
        this.mobile,
        this.gender,
        this.parentMobile,
        this.maritalStatus,
        this.religion,
        this.casteCategory,
        this.email});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    dob = json['dob'];
    age = json['age'];
    aadharNumber = json['aadharNumber'];
    aadharCard = json['aadharCard'];
    mobile = json['mobile'];
    gender = json['gender'];
    parentMobile = json['parentMobile'];
    maritalStatus = json['maritalStatus'];
    religion = json['religion'];
    casteCategory = json['casteCategory'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['dob'] = dob;
    data['age'] = age;
    data['aadharNumber'] = aadharNumber;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['parentMobile'] = parentMobile;
    data['maritalStatus'] = maritalStatus;
    data['religion'] = religion;
    data['casteCategory'] = casteCategory;
    data['email'] = email;
    return data;
  }
}

class IncomeDetails {
  int? familyIncome;
  String? incomeCertificateNumber;
  String? incomeIssuingAuthority;
  String? incomeCertificate;
  String? incomeCertificateIssuedDate;

  IncomeDetails(
      {this.familyIncome,
        this.incomeCertificateNumber,
        this.incomeIssuingAuthority,
        this.incomeCertificate,
        this.incomeCertificateIssuedDate});

  IncomeDetails.fromJson(Map<String, dynamic> json) {
    familyIncome = json['familyIncome'];
    incomeCertificateNumber = json['incomeCertificateNumber'];
    incomeIssuingAuthority = json['incomeIssuingAuthority'];
    incomeCertificate = json['incomeCertificate'];
    incomeCertificateIssuedDate = json['incomeCertificateIssuedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['familyIncome'] = familyIncome;
    data['incomeCertificateNumber'] = incomeCertificateNumber;
    data['incomeIssuingAuthority'] = incomeIssuingAuthority;
    data['incomeCertificate'] = incomeCertificate;
    data['incomeCertificateIssuedDate'] = incomeCertificateIssuedDate;
    return data;
  }
}

class DomicileDetails {
  String? domicileCertificateNumber;
  String? domicileIssuingAuthority;
  String? domicileIssuingDate;
  String? domicileCertificate;

  DomicileDetails(
      {this.domicileCertificateNumber,
        this.domicileIssuingAuthority,
        this.domicileIssuingDate,
        this.domicileCertificate});

  DomicileDetails.fromJson(Map<String, dynamic> json) {
    domicileCertificateNumber = json['domicileCertificateNumber'];
    domicileIssuingAuthority = json['domicileIssuingAuthority'];
    domicileIssuingDate = json['domicileIssuingDate'];
    domicileCertificate = json['domicileCertificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domicileCertificateNumber'] = domicileCertificateNumber;
    data['domicileIssuingAuthority'] = domicileIssuingAuthority;
    data['domicileIssuingDate'] = domicileIssuingDate;
    data['domicileCertificate'] = domicileCertificate;
    return data;
  }
}

class BankDetails {
  String? accountNumber;
  String? ifsc;
  String? bankName;
  String? branchName;

  BankDetails({this.accountNumber, this.ifsc, this.bankName, this.branchName});

  BankDetails.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    ifsc = json['ifsc'];
    bankName = json['bankName'];
    branchName = json['branchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['ifsc'] = ifsc;
    data['bankName'] = bankName;
    data['branchName'] = branchName;
    return data;
  }
}

class Address {
  String? address;
  String? city;
  String? district;
  String? state;
  String? pincode;

  Address({this.address, this.city, this.district, this.state, this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['pincode'] = pincode;
    return data;
  }
}

class ParentsDetails {
  bool? isFatherAlive;
  String? fatherName;
  String? fatherOccupation;
  bool? isFatherSalaried;
  bool? isMotherAlive;
  String? motherName;
  String? motherOccupation;
  bool? isMotherSalaried;

  ParentsDetails(
      {this.isFatherAlive,
        this.fatherName,
        this.fatherOccupation,
        this.isFatherSalaried,
        this.isMotherAlive,
        this.motherName,
        this.motherOccupation,
        this.isMotherSalaried});

  ParentsDetails.fromJson(Map<String, dynamic> json) {
    isFatherAlive = json['isFatherAlive'];
    fatherName = json['fatherName'];
    fatherOccupation = json['fatherOccupation'];
    isFatherSalaried = json['isFatherSalaried'];
    isMotherAlive = json['isMotherAlive'];
    motherName = json['motherName'];
    motherOccupation = json['motherOccupation'];
    isMotherSalaried = json['isMotherSalaried'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isFatherAlive'] = isFatherAlive;
    data['fatherName'] = fatherName;
    data['fatherOccupation'] = fatherOccupation;
    data['isFatherSalaried'] = isFatherSalaried;
    data['isMotherAlive'] = isMotherAlive;
    data['motherName'] = motherName;
    data['motherOccupation'] = motherOccupation;
    data['isMotherSalaried'] = isMotherSalaried;
    return data;
  }
}

class HostelDetails {
  String? hostelCategory;
  int? hostelFees;
  String? hostelType;
  String? hostelCertificate;
  int? messFees;
  bool? isMessAvailable;

  HostelDetails(
      {this.hostelCategory,
        this.hostelFees,
        this.hostelType,
        this.hostelCertificate,
        this.messFees,
        this.isMessAvailable
      });

  HostelDetails.fromJson(Map<String, dynamic> json) {
    hostelCategory = json['hostelCategory'];
    hostelFees = json['hostelFees'];
    hostelType = json['hostelType'];
    hostelCertificate = json['hostelCertificate'];
    messFees = json['messFees'];
    isMessAvailable = json['isMessAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hostelCategory'] = hostelCategory;
    data['hostelFees'] = hostelFees;
    data['hostelType'] = hostelType;
    data['hostelCertificate'] = hostelCertificate;
    data['messFees'] = messFees;
    data['isMessAvailable'] = isMessAvailable;
    return data;
  }
}

class CurrentQualification {
  String? qualificationLevel;
  String? stream;
  String? instituteState;
  String? instituteCity;
  String? instituteDistrict;
  String? instituteTaluka;
  String? instituteName;
  String? admissionYear;
  int? yearOfStudy;
  String? mode;
  double? meritPercentile;
  String? capId;
  String? admissionType;
  String? admissionReservation;
  String? completed;
  String? result;
  double? percentage;
  String? certificate;
  int? gapYears;
  String? sId;

  CurrentQualification(
      {this.qualificationLevel,
        this.stream,
        this.instituteState,
        this.instituteCity,
        this.instituteDistrict,
        this.instituteTaluka,
        this.instituteName,
        this.admissionYear,
        this.yearOfStudy,
        this.mode,
        this.meritPercentile,
        this.capId,
        this.admissionType,
        this.admissionReservation,
        this.completed,
        this.result,
        this.percentage,
        this.certificate,
        this.gapYears,
        this.sId});

  CurrentQualification.fromJson(Map<String, dynamic> json) {
    qualificationLevel = json['qualificationLevel'];
    stream = json['stream'];
    instituteState = json['instituteState'];
    instituteCity = json['instituteCity'];
    instituteDistrict = json['instituteDistrict'];
    instituteTaluka = json['instituteTaluka'];
    instituteName = json['instituteName'];
    admissionYear = json['admissionYear'];
    yearOfStudy = json['yearOfStudy'];
    mode = json['mode'];
    meritPercentile = json['meritPercentile'];
    capId = json['capId'];
    admissionType = json['admissionType'];
    admissionReservation = json['admissionReservation'];
    completed = json['completed'];
    result = json['result'];
    percentage = json['percentage'];
    certificate = json['certificate'];
    gapYears = json['gapYears'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qualificationLevel'] =qualificationLevel;
    data['stream'] =stream;
    data['instituteState'] =instituteState;
    data['instituteCity'] =instituteCity;
    data['instituteDistrict'] =instituteDistrict;
    data['instituteTaluka'] =instituteTaluka;
    data['instituteName'] =instituteName;
    data['admissionYear'] =admissionYear;
    data['yearOfStudy'] =yearOfStudy;
    data['mode'] =mode;
    data['meritPercentile'] =meritPercentile;
    data['capId'] =capId;
    data['admissionType'] =admissionType;
    data['admissionReservation'] =admissionReservation;
    data['completed'] =completed;
    data['result'] =result;
    data['percentage'] =percentage;
    data['certificate'] =certificate;
    data['gapYears'] =gapYears;
    data['_id'] =sId;
    return data;
  }
}

class PastQualifications {
  String? qualificationLevel;
  String? stream;
  String? completed;
  String? instituteState;
  String? instituteCity;
  String? instituteDistrict;
  String? instituteTaluka;
  String? instituteName;
  String? course;
  String? boardUniversity;
  String? admissionYear;
  String? passingYear;
  String? result;
  double? percentage;
  int? attempts;
  String? certificate;
  bool? wasAnyGaps;
  int? gapYears;
  String? sId;

  PastQualifications(
      {this.qualificationLevel,
        this.stream,
        this.completed,
        this.instituteState,
        this.instituteCity,
        this.instituteDistrict,
        this.instituteTaluka,
        this.instituteName,
        this.course,
        this.boardUniversity,
        this.admissionYear,
        this.passingYear,
        this.result,
        this.percentage,
        this.attempts,
        this.certificate,
        this.wasAnyGaps,
        this.gapYears,
        this.sId});

  PastQualifications.fromJson(Map<String, dynamic> json) {
    qualificationLevel = json['qualificationLevel'];
    stream = json['stream'];
    completed = json['completed'];
    instituteState = json['instituteState'];
    instituteCity = json['instituteCity'];
    instituteDistrict = json['instituteDistrict'];
    instituteTaluka = json['instituteTaluka'];
    instituteName = json['instituteName'];
    course = json['course'];
    boardUniversity = json['boardUniversity'];
    admissionYear = json['admissionYear'];
    passingYear = json['passingYear'];
    result = json['result'];
    percentage = json['percentage'];
    attempts = json['attempts'];
    certificate = json['certificate'];
    wasAnyGaps = json['wasAnyGaps'];
    gapYears = json['gapYears'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qualificationLevel'] = qualificationLevel;
    data['stream'] = stream;
    data['completed'] = completed;
    data['instituteState'] = instituteState;
    data['instituteCity'] = instituteCity;
    data['instituteDistrict'] = instituteDistrict;
    data['instituteTaluka'] = instituteTaluka;
    data['instituteName'] = instituteName;
    data['course'] = course;
    data['boardUniversity'] = boardUniversity;
    data['admissionYear'] = admissionYear;
    data['passingYear'] = passingYear;
    data['result'] = result;
    data['percentage'] = percentage;
    data['attempts'] = attempts;
    data['certificate'] = certificate;
    data['wasAnyGaps'] = wasAnyGaps;
    data['gapYears'] = gapYears;
    data['_id'] = sId;
    return data;
  }
}
