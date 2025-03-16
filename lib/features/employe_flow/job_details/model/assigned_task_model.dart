class AssignedTaskModel {
  final bool success;
  final int statusCode;
  final String message;
  final TaskData data;

  AssignedTaskModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AssignedTaskModel.fromJson(Map<String, dynamic> json) {
    return AssignedTaskModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: TaskData.fromJson(json['data'] ?? {}),
    );
  }
}

class TaskData {
  final UserData user;
  final JobData job;

  TaskData({
    required this.user,
    required this.job,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      user: UserData.fromJson(json['user'] ?? {}),
      job: JobData.fromJson(json['job'] ?? {}),
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String personId;
  final String profileImage;
  final List<JobRole> job;

  UserData({
    required this.id,
    required this.name,
    required this.personId,
    required this.profileImage,
    required this.job,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      personId: json['personId'] ?? '',
      profileImage: json['profileImage'] ?? '',
      job: (json['job'] as List<dynamic>?)
              ?.map((item) => JobRole.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class JobRole {
  final String role;

  JobRole({required this.role});

  factory JobRole.fromJson(Map<String, dynamic> json) {
    return JobRole(
      role: json['role'] ?? '',
    );
  }
}

class JobData {
  final String id;
  final String jobId;
  final List<String> image;
  final String title;
  final String location;
  final String date;
  final String time;
  final String locationLink;
  final String description;
  final String rate;
  final String duration;
  final String note;
  final List<String> progress;
  final List<String> requiredTools;
  final String customerName;
  final String customerPhone;
  final String managerName;
  final String managerPhone;
  final String workPhoto;
  final String? notes;
  final String status;
  final String createdAt;
  final String updatedAt;

  JobData({
    required this.id,
    required this.jobId,
    required this.image,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.locationLink,
    required this.description,
    required this.rate,
    required this.duration,
    required this.note,
    required this.progress,
    required this.requiredTools,
    required this.customerName,
    required this.customerPhone,
    required this.managerName,
    required this.managerPhone,
    required this.workPhoto,
    this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      id: json['id'] ?? '',
      jobId: json['jobId'] ?? '',
      image: List<String>.from(json['image'] ?? []),
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      locationLink: json['locationLink'] ?? '',
      description: json['description'] ?? '',
      rate: json['rate'] ?? '',
      duration: json['duration'] ?? '',
      note: json['note'] ?? '',
      progress: List<String>.from(json['progress'] ?? []),
      requiredTools: List<String>.from(json['requiredTools'] ?? []),
      customerName: json['customerName'] ?? '',
      customerPhone: json['customerPhone'] ?? '',
      managerName: json['managerName'] ?? '',
      managerPhone: json['managerPhone'] ?? '',
      workPhoto: json['workPhoto'] ?? '',
      notes: json['notes'],
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
