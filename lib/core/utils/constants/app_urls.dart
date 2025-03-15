class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.36:5001/api/v1';
  static const String login = '$_baseUrl/auth/login';
  static const String register = "$_baseUrl/users";
  static const String allJobs = "$_baseUrl/jobs";
  static const String assigned = "$_baseUrl/jobs?search=ASSIGNED";
  static const String unAssigned = "$_baseUrl/jobs?search=UNASSIGNED";
  static const String compleated = "$_baseUrl/jobs?search=COMPLETED";
  static const String allTaskStatus = "$_baseUrl/jobs/task-status";
  static const String tasks = "$_baseUrl/tasks";
  static const String notification = "$_baseUrl/notifications";
  static const String adminNotification = "$_baseUrl/notifications/admin";
}
