

class SupervisorNotificationModel {
  final bool success;
  final int statusCode;
  final String message;
  final NotificationData data;

  SupervisorNotificationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SupervisorNotificationModel.fromJson(Map<String, dynamic> json) {
    return SupervisorNotificationModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: NotificationData.fromJson(json["data"] ?? {}),
    );
  }
}

class NotificationData {
  final Meta meta;
  final List<NotificationItem> notifications;

  NotificationData({
    required this.meta,
    required this.notifications,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      meta: Meta.fromJson(json["meta"] ?? {}),
      notifications: (json["data"] as List?)?.map((e) => NotificationItem.fromJson(e)).toList() ?? [],
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
      page: json["page"] ?? 0,
      limit: json["limit"] ?? 0,
      total: json["total"] ?? 0,
      totalPage: json["totalPage"] ?? 0,
    );
  }
}

class NotificationItem {
  final String id;
  final String jobId;
  final String title;
  final String body;
  final String senderId;
  final String createdAt;
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
      id: json["id"] ?? "",
      jobId: json["jobId"] ?? "",
      title: json["title"] ?? "",
      body: json["body"] ?? "",
      senderId: json["senderId"] ?? "",
      createdAt: json["createdAt"] ?? "",
      job: Job.fromJson(json["job"] ?? {}),
    );
  }
}

class Job {
  final String title;
  final String location;
  final String date;
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
      title: json["title"] ?? "",
      location: json["location"] ?? "",
      date: json["date"] ?? "",
      time: json["time"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
