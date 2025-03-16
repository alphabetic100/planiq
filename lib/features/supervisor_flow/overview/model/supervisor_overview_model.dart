class SupervisorOverviewModel {
  final bool success;
  final int statusCode;
  final String message;
  final TaskCountData data;

  SupervisorOverviewModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SupervisorOverviewModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return SupervisorOverviewModel(
        success: false,
        statusCode: 0,
        message: '',
        data: TaskCountData.empty(),
      );
    }
    return SupervisorOverviewModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: TaskCountData.fromJson(json['data']),
    );
  }
}

class TaskCountData {
  final int total;
  final int assigned;
  final int unassigned;
  final int completed;
  final int accepted;
  final int wip;

  TaskCountData({
    required this.total,
    required this.assigned,
    required this.unassigned,
    required this.completed,
    required this.accepted,
    required this.wip,
  });

  factory TaskCountData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TaskCountData.empty();
    }
    return TaskCountData(
      total: json['TOTAL'] ?? 0,
      assigned: json['ASSIGNED'] ?? 0,
      unassigned: json['UNASSIGNED'] ?? 0,
      completed: json['COMPLETED'] ?? 0,
      accepted: json['ACCEPTED'] ?? 0,
      wip: json['WIP'] ?? 0,
    );
  }

  factory TaskCountData.empty() {
    return TaskCountData(
      total: 0,
      assigned: 0,
      unassigned: 0,
      completed: 0,
      accepted: 0,
      wip: 0,
    );
  }
}
