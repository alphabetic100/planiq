class AllJobsListModel {
  final bool success;
  final int statusCode;
  final String message;
  final JobData data;

  AllJobsListModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllJobsListModel.fromJson(Map<String, dynamic> json) {
    return AllJobsListModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: JobData.fromJson(json["data"] ?? {}),
    );
  }
}

class JobData {
  final Meta meta;
  final List<Job> jobs;

  JobData({
    required this.meta,
    required this.jobs,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      meta: Meta.fromJson(json["meta"] ?? {}),
      jobs: (json["data"] as List?)?.map((e) => Job.fromJson(e)).toList() ?? [],
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
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      location: json["location"] ?? "",
      date: json["date"] ?? "",
      time: json["time"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
