class EmployeeHomeModel {
  final bool success;
  final int statusCode;
  final String message;
  final TaskData data;

  EmployeeHomeModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory EmployeeHomeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeHomeModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? TaskData.fromJson(json['data'])
          : TaskData.empty(),
    );
  }
}

class TaskData {
  final Meta meta;
  final TaskDetails data;

  TaskData({required this.meta, required this.data});

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : Meta.empty(),
      data: json['data'] != null
          ? TaskDetails.fromJson(json['data'])
          : TaskDetails.empty(),
    );
  }

  factory TaskData.empty() =>
      TaskData(meta: Meta.empty(), data: TaskDetails.empty());
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPage;

  Meta(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }

  factory Meta.empty() => Meta(total: 0, page: 0, limit: 0, totalPage: 0);
}

class TaskDetails {
  final List<Result> result;
  final int completed;
  final int schedule;

  TaskDetails(
      {required this.result, required this.completed, required this.schedule});

  factory TaskDetails.fromJson(Map<String, dynamic> json) {
    return TaskDetails(
      result: json['result'] != null
          ? List<Result>.from(json['result'].map((x) => Result.fromJson(x)))
          : [],
      completed: json['completed'] ?? 0,
      schedule: json['schedule'] ?? 0,
    );
  }

  factory TaskDetails.empty() =>
      TaskDetails(result: [], completed: 0, schedule: 0);
}

class Result {
  final String id;
  final String jobId;
  final Job job;

  Result({required this.id, required this.jobId, required this.job});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] ?? '',
      jobId: json['jobId'] ?? '',
      job: json['job'] != null ? Job.fromJson(json['job']) : Job.empty(),
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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
    );
  }

  factory Job.empty() =>
      Job(id: '', title: '', location: '', date: '', time: '', status: '');
}
