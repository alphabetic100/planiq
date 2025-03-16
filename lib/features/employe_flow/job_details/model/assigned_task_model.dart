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
  final String id;
  final List<TaskItem> tasks;

  TaskData({
    required this.id,
    required this.tasks,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      id: json['id'] ?? '',
      tasks: (json['Task'] as List?)?.map((e) => TaskItem.fromJson(e)).toList() ?? [],
    );
  }
}

class TaskItem {
  final String id;
  final User user;

  TaskItem({
    required this.id,
    required this.user,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String id;
  final String name;
  final String personId;
  final String profileImage;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.personId,
    required this.profileImage,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      personId: json['personId'] ?? '',
      profileImage: json['profileImage'] ?? '',
      role: json['role'] ?? '',
    );
  }
}