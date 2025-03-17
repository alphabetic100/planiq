class MyJobsModel {
  final bool success;
  final int statusCode;
  final String message;
  final TaskData data;

  MyJobsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MyJobsModel.fromJson(Map<String, dynamic>? json) {
    return MyJobsModel(
      success: json?["success"] ?? false,
      statusCode: json?["statusCode"] ?? 0,
      message: json?["message"] ?? "",
      data: TaskData.fromJson(json?["data"] ?? {}),
    );
  }
}

class TaskData {
  final Meta meta;
  final List<TaskItem> tasks;

  TaskData({
    required this.meta,
    required this.tasks,
  });

  factory TaskData.fromJson(Map<String, dynamic>? json) {
    return TaskData(
      meta: Meta.fromJson(json?["meta"] ?? {}),
      tasks:
          (json?["data"] as List?)?.map((e) => TaskItem.fromJson(e)).toList() ??
              [],
    );
  }
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPage;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic>? json) {
    return Meta(
      total: json?["total"] ?? 0,
      page: json?["page"] ?? 0,
      limit: json?["limit"] ?? 0,
      totalPage: json?["totalPage"] ?? 0,
    );
  }
}

class TaskItem {
  final String id;
  final String jobId;
  final Job job;

  TaskItem({
    required this.id,
    required this.jobId,
    required this.job,
  });

  factory TaskItem.fromJson(Map<String, dynamic>? json) {
    return TaskItem(
      id: json?["id"] ?? "",
      jobId: json?["jobId"] ?? "",
      job: Job.fromJson(json?["job"] ?? {}),
    );
  }
}

class Job {
  final String id;
  final String title;
  final String location;
  final String date;
  final String time;
  final String status;

  Job({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Job.fromJson(Map<String, dynamic>? json) {
    return Job(
      id: json?["id"] ?? "",
      title: json?["title"] ?? "",
      location: json?["location"] ?? "",
      date: json?["date"] ?? "",
      time: json?["time"] ?? "",
      status: json?["status"] ?? "",
    );
  }
}
