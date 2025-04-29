class ScholarshipModel {
  Eligibility? eligibility;
  Provider? provider;
  String? sId;
  String? title;
  String? description;
  String? scholarshipType;
  String? deadline;
  List<String>? documentsRequired;
  String? status;
  String? createdAt;
  String? updatedAt;

  ScholarshipModel(
      {this.eligibility,
        this.provider,
        this.sId,
        this.title,
        this.description,
        this.scholarshipType,
        this.deadline,
        this.documentsRequired,
        this.status,
        this.createdAt,
        this.updatedAt});

  ScholarshipModel.fromJson(Map<String, dynamic> json) {
    eligibility = json['eligibility'] != null
        ? Eligibility.fromJson(json['eligibility'])
        : null;
    provider = json['provider'] != null
        ? Provider.fromJson(json['provider'])
        : null;
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    scholarshipType = json['scholarshipType'];
    deadline = json['deadline'];
    documentsRequired = json['documentsRequired'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eligibility != null) {
      data['eligibility'] = eligibility!.toJson();
    }
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['scholarshipType'] = scholarshipType;
    data['deadline'] = deadline;
    data['documentsRequired'] = documentsRequired;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Eligibility {
  AcademicCriteria? academicCriteria;
  String? casteCategory;
  int? incomeLimit;

  Eligibility({this.academicCriteria, this.casteCategory, this.incomeLimit});

  Eligibility.fromJson(Map<String, dynamic> json) {
    academicCriteria = json['academicCriteria'] != null
        ? AcademicCriteria.fromJson(json['academicCriteria'])
        : null;
    casteCategory = json['casteCategory'];
    incomeLimit = json['incomeLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (academicCriteria != null) {
      data['academicCriteria'] = academicCriteria!.toJson();
    }
    data['casteCategory'] = casteCategory;
    data['incomeLimit'] = incomeLimit;
    return data;
  }
}

class AcademicCriteria {
  int? minPercentage;
  List<String>? applicableCourses;

  AcademicCriteria({this.minPercentage, this.applicableCourses});

  AcademicCriteria.fromJson(Map<String, dynamic> json) {
    minPercentage = json['minPercentage'];
    applicableCourses = json['applicableCourses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minPercentage'] = minPercentage;
    data['applicableCourses'] = applicableCourses;
    return data;
  }
}

class Provider {
  String? name;
  String? department;

  Provider({this.name, this.department});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['department'] = department;
    return data;
  }
}
