class ReportBoxModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  ReportBoxModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ReportBoxModel.fromJson(Map<String, dynamic> json) {
    return ReportBoxModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  Meta meta;
  List<ReportData> data;

  Data({
    required this.meta,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      meta: Meta.fromJson(json['meta'] ?? {}),
      data: (json['data'] as List?)
              ?.map((item) => ReportData.fromJson(item ?? {}))
              .toList() ??
          [],
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

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }
}

class ReportData {
  String id;
  String jobId;
  String issue;
  String createdAt;
  User user;
  Job job;

  ReportData({
    required this.id,
    required this.jobId,
    required this.issue,
    required this.createdAt,
    required this.user,
    required this.job,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      id: json['id'] ?? '',
      jobId: json['jobId'] ?? '',
      issue: json['issue'] ?? '',
      createdAt: json['createdAt'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      job: Job.fromJson(json['job'] ?? {}),
    );
  }
}

class User {
  String name;
  String personId;
  String profileImage;

  User({
    required this.name,
    required this.personId,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      personId: json['personId'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Job {
  String title;
  String location;
  String date;
  String time;
  String status;

  Job({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
