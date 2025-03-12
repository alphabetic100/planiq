class AllEmployeeData {
  bool success;
  int statusCode;
  String message;
  Data data;

  AllEmployeeData({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  // Handle null data in constructor
  factory AllEmployeeData.fromJson(Map<String, dynamic> json) {
    return AllEmployeeData(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  Meta meta;
  List<Datum> data;

  Data({
    required this.meta,
    required this.data,
  });

  // Handle null values in constructor
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      meta: Meta.fromJson(json['meta'] ?? {}),
      data:
          (json['data'] as List?)?.map((e) => Datum.fromJson(e)).toList() ?? [],
    );
  }
}

class Datum {
  String id;
  String name;
  String personId;
  String password;
  String designation;
  DateTime dateOfBirth;
  String gender;
  String fcmToken;
  String profileImage;
  String role;
  String status;
  List<String> specialization;
  DateTime createdAt;
  DateTime updatedAt;
  List<Job> job;
  List<Administrative> administrative;

  Datum({
    required this.id,
    required this.name,
    required this.personId,
    required this.password,
    required this.designation,
    required this.dateOfBirth,
    required this.gender,
    required this.fcmToken,
    required this.profileImage,
    required this.role,
    required this.status,
    required this.specialization,
    required this.createdAt,
    required this.updatedAt,
    required this.job,
    required this.administrative,
  });

  // Handle null values in constructor
  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      personId: json['personId'] ?? "",
      password: json['password'] ?? "",
      designation: json['designation'] ?? "",
      dateOfBirth:
          DateTime.tryParse(json['dateOfBirth'] ?? "") ?? DateTime.now(),
      gender: json['gender'] ?? "",
      fcmToken: json['fcmToken'] ?? "",
      profileImage: json['profileImage'] ?? "",
      role: json['role'] ?? "",
      status: json['status'] ?? "",
      specialization: (json['specialization'] as List?)
              ?.map((e) => e as String? ?? "")
              .toList() ??
          [],
      createdAt: DateTime.tryParse(json['createdAt'] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? "") ?? DateTime.now(),
      job: (json['job'] as List?)?.map((e) => Job.fromJson(e)).toList() ?? [],
      administrative: (json['administrative'] as List?)
              ?.map((e) => Administrative.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Administrative {
  String id;
  String userId;
  DateTime joinDate;
  String location;
  String employeeType;

  Administrative({
    required this.id,
    required this.userId,
    required this.joinDate,
    required this.location,
    required this.employeeType,
  });

  // Handle null values in constructor
  factory Administrative.fromJson(Map<String, dynamic> json) {
    return Administrative(
      id: json['id'] ?? "",
      userId: json['userId'] ?? "",
      joinDate: DateTime.tryParse(json['joinDate'] ?? "") ?? DateTime.now(),
      location: json['location'] ?? "",
      employeeType: json['employeeType'] ?? "",
    );
  }
}

class Job {
  String id;
  String userId;
  String role;
  String serviceLength;
  String department;

  Job({
    required this.id,
    required this.userId,
    required this.role,
    required this.serviceLength,
    required this.department,
  });

  // Handle null values in constructor
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? "",
      userId: json['userId'] ?? "",
      role: json['role'] ?? "",
      serviceLength: json['serviceLength'] ?? "",
      department: json['department'] ?? "",
    );
  }
}

class Meta {
  int total;
  int page;
  int limit;
  int totalPage;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPage,
  });

  // Handle null values in constructor
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }
}
