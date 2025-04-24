class MyAppliedSchemesModel {
  String? sId;
  String? userId;
  String? profileId;
  ScholarshipId? scholarshipId;
  List<To>? to;
  List<String>? reviewComments;
  String? status;
  Authority? currentRecipient;
  String? createdAt;

  MyAppliedSchemesModel(
      {this.sId,
        this.userId,
        this.profileId,
        this.scholarshipId,
        this.to,
        this.reviewComments,
        this.status,
        this.currentRecipient,
        this.createdAt});

  MyAppliedSchemesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    profileId = json['profileId'];
    scholarshipId = json['scholarshipId'] != null
        ? ScholarshipId.fromJson(json['scholarshipId'])
        : null;
    if (json['to'] != null) {
      to = <To>[];
      json['to'].forEach((v) {
        to!.add(To.fromJson(v));
      });
    }
    reviewComments = json['reviewComments'].cast<String>();
    status = json['status'];
    currentRecipient = json['currentRecipient'] != null
        ? Authority.fromJson(json['currentRecipient'])
        : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['profileId'] = profileId;
    if (scholarshipId != null) {
      data['scholarshipId'] = scholarshipId!.toJson();
    }
    if (to != null) {
      data['to'] = to!.map((v) => v.toJson()).toList();
    }
    data['reviewComments'] = reviewComments;
    data['status'] = status;
    if (currentRecipient != null) {
      data['currentRecipient'] = currentRecipient!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class ScholarshipId {
  Provider? provider;
  String? sId;
  String? title;

  ScholarshipId({this.provider, this.sId, this.title});

  ScholarshipId.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? Provider.fromJson(json['provider'])
        : null;
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
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

class To {
  Authority? authority;
  String? status;
  String? sId;

  To({this.authority, this.status, this.sId});

  To.fromJson(Map<String, dynamic> json) {
    authority = json['authority'] != null
        ? Authority.fromJson(json['authority'])
        : null;
    status = json['status'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authority != null) {
      data['authority'] = authority!.toJson();
    }
    data['status'] = status;
    data['_id'] = sId;
    return data;
  }
}

class Authority {
  String? sId;
  String? role;

  Authority({this.sId, this.role});

  Authority.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['role'] = role;
    return data;
  }
}
