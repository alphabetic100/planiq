class EmployeeNotificationModel {
  final bool success;
  final int statusCode;
  final String message;
  final NotificationData data;

  EmployeeNotificationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory EmployeeNotificationModel.fromJson(Map<String, dynamic> json) {
    return EmployeeNotificationModel(
      success: json['success'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 0,
      message: json['message'] as String? ?? "",
      data: NotificationData.fromJson(
          json['data'] as Map<String, dynamic>? ?? {}),
    );
  }
}

class NotificationData {
  final Meta meta;
  final List<NotificationItem> data;

  NotificationData({
    required this.meta,
    required this.data,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>? ?? {}),
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) =>
              NotificationItem.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      totalPage: json['totalPage'] as int? ?? 0,
    );
  }
}

class NotificationItem {
  final String id;
  final String jobId;
  final String title;
  final String body;
  final String senderId;
  final DateTime createdAt;
  final Job job;

  NotificationItem({
    required this.id,
    required this.jobId,
    required this.title,
    required this.body,
    required this.senderId,
    required this.createdAt,
    required this.job,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'] as String? ?? "",
      jobId: json['jobId'] as String? ?? "",
      title: json['title'] as String? ?? "",
      body: json['body'] as String? ?? "",
      senderId: json['senderId'] as String? ?? "",
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? "") ??
          DateTime(1970, 1, 1),
      job: Job.fromJson(json['job'] as Map<String, dynamic>? ?? {}),
    );
  }
}

class Job {
  final String title;
  final String location;
  final DateTime date;
  final String time;
  final String status;

  Job({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'] as String? ?? "",
      location: json['location'] as String? ?? "",
      date: DateTime.tryParse(json['date'] as String? ?? "") ??
          DateTime(1970, 1, 1),
      time: json['time'] as String? ?? "",
      status: json['status'] as String? ?? "",
    );
  }
}
