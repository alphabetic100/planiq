class AdminNotificationModel {
  final bool success;
  final int statusCode;
  final String message;
  final NotificationData data;

  AdminNotificationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AdminNotificationModel.fromJson(Map<String, dynamic> json) {
    return AdminNotificationModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: NotificationData.fromJson(json["data"] ?? {}),
    );
  }
}

class NotificationData {
  final MetaData meta;
  final List<NotificationItem> notifications;

  NotificationData({
    required this.meta,
    required this.notifications,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      meta: MetaData.fromJson(json["meta"] ?? {}),
      notifications: (json["data"] as List?)
              ?.map((e) => NotificationItem.fromJson(e ?? {}))
              .toList() ??
          [],
    );
  }
}

class MetaData {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  MetaData({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
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
  final String status;
  final String body;
  final String senderId;
  final String createdAt;

  NotificationItem({
    required this.id,
    required this.jobId,
    required this.title,
    required this.status,
    required this.body,
    required this.senderId,
    required this.createdAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json["id"] ?? "",
      jobId: json["jobId"] ?? "",
      title: json["title"] ?? "",
      status: json["status"] ?? "",
      body: json["body"] ?? "",
      senderId: json["senderId"] ?? "",
      createdAt: json["createdAt"] ?? "",
    );
  }
}
