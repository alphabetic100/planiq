class TaskCountResponse {
  final bool success;
  final int statusCode;
  final String message;
  final TaskCountData data;

  TaskCountResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TaskCountResponse.fromJson(Map<String, dynamic> json) {
    return TaskCountResponse(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: TaskCountData.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "statusCode": statusCode,
      "message": message,
      "data": data.toJson(),
    };
  }
}

class TaskCountData {
  final String total;
  final String assigned;
  final String unassigned;
  final String completed;

  TaskCountData({
    required this.total,
    required this.assigned,
    required this.unassigned,
    required this.completed,
  });

  factory TaskCountData.fromJson(Map<String, dynamic> json) {
    return TaskCountData(
      total: (json["TOTAL"] ?? 0).toString(),
      assigned: (json["ASSIGNED"] ?? 0).toString(),
      unassigned: (json["UNASSIGNED"] ?? 0).toString(),
      completed: (json["COMPLETED"] ?? 0).toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "TOTAL": total,
      "ASSIGNED": assigned,
      "UNASSIGNED": unassigned,
      "COMPLETED": completed,
    };
  }
}
