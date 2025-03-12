class EmployeDetailsModel {
  bool success;
  int statusCode;
  String message;
  UserData data;

  EmployeDetailsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  // Handle null values in constructor
  factory EmployeDetailsModel.fromJson(Map<String, dynamic> json) {
    return EmployeDetailsModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
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
  int totalJobs;
  int completedJobs;
  int decline;
  int accepted;

  UserData({
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
    required this.totalJobs,
    required this.completedJobs,
    required this.decline,
    required this.accepted,
  });

  // Handle null values in constructor
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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
      specialization:
          (json['specialization'] as List?)?.map((e) => e as String? ?? "").toList() ?? [],
      createdAt: DateTime.tryParse(json['createdAt'] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? "") ?? DateTime.now(),
      job: (json['job'] as List?)?.map((e) => Job.fromJson(e)).toList() ?? [],
      administrative: (json['administrative'] as List?)
              ?.map((e) => Administrative.fromJson(e))
              .toList() ??
          [],
      totalJobs: json['totalJobs'] ?? 0,
      completedJobs: json['completedJobs'] ?? 0,
      decline: json['decline'] ?? 0,
      accepted: json['accepted'] ?? 0,
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
