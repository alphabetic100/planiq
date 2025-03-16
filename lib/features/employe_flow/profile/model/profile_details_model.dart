class ProfileDetailsModel {
  final bool success;
  final int statusCode;
  final String message;
  final ProfileData data;

  ProfileDetailsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProfileDetailsModel(
        success: false,
        statusCode: 0,
        message: '',
        data: ProfileData.empty(),
      );
    }
    return ProfileDetailsModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: ProfileData.fromJson(json['data']),
    );
  }
}

class ProfileData {
  final String id;
  final String name;
  final String personId;
  final String password;
  final String designation;
  final String dateOfBirth;
  final String gender;
  final String fcmToken;
  final String profileImage;
  final String role;
  final String status;
  final List<String> specialization;
  final String createdAt;
  final String updatedAt;
  final List<Job> job;
  final List<Administrative> administrative;
  final int totalJobs;
  final int completedJobs;
  final int decline;
  final int accepted;

  ProfileData({
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

  factory ProfileData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ProfileData.empty();
    }
    return ProfileData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      personId: json['personId'] ?? '',
      password: json['password'] ?? '',
      designation: json['designation'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
      profileImage: json['profileImage'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      specialization: List<String>.from(json['specialization'] ?? []),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
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

  factory ProfileData.empty() {
    return ProfileData(
      id: '',
      name: '',
      personId: '',
      password: '',
      designation: '',
      dateOfBirth: '',
      gender: '',
      fcmToken: '',
      profileImage: '',
      role: '',
      status: '',
      specialization: [],
      createdAt: '',
      updatedAt: '',
      job: [],
      administrative: [],
      totalJobs: 0,
      completedJobs: 0,
      decline: 0,
      accepted: 0,
    );
  }
}

class Job {
  final String id;
  final String userId;
  final String role;
  final String serviceLength;
  final String department;

  Job({
    required this.id,
    required this.userId,
    required this.role,
    required this.serviceLength,
    required this.department,
  });

  factory Job.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Job.empty();
    }
    return Job(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      role: json['role'] ?? '',
      serviceLength: json['serviceLength'] ?? '',
      department: json['department'] ?? '',
    );
  }

  factory Job.empty() {
    return Job(id: '', userId: '', role: '', serviceLength: '', department: '');
  }
}

class Administrative {
  final String id;
  final String userId;
  final String joinDate;
  final String location;
  final String employeeType;

  Administrative({
    required this.id,
    required this.userId,
    required this.joinDate,
    required this.location,
    required this.employeeType,
  });

  factory Administrative.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Administrative.empty();
    }
    return Administrative(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      joinDate: json['joinDate'] ?? '',
      location: json['location'] ?? '',
      employeeType: json['employeeType'] ?? '',
    );
  }

  factory Administrative.empty() {
    return Administrative(
        id: '', userId: '', joinDate: '', location: '', employeeType: '');
  }
}
