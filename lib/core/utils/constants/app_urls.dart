class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://137.184.86.119:5029/api/v1';
  static const String login = '$_baseUrl/auth/login';
  static const String register = "$_baseUrl/users";
  static const String allJobs = "$_baseUrl/jobs";
  static const String assigned = "$_baseUrl/jobs?search=ASSIGNED";
  static const String unAssigned = "$_baseUrl/jobs?search=UNASSIGNED";
  static const String compleated = "$_baseUrl/jobs?search=COMPLETED";
  static const String wip = "$_baseUrl/jobs?search=WIP";
  static const String allTaskStatus = "$_baseUrl/jobs/task-status";
  static const String tasks = "$_baseUrl/tasks";
  static const String notification = "$_baseUrl/notifications";
  static const String adminNotification = "$_baseUrl/notifications/admin";
  static const String issue = "$_baseUrl/tasks/issue/";
  static const String payment = "$_baseUrl/tasks/payment/";
  static const String getPayments = "$_baseUrl/tasks/get-payment";
  static const String getReports = "$_baseUrl/tasks/get-report";
  static const String superviserNotification =
      "$_baseUrl/notifications/super-viser";
  static const String superTaskStatus = "$_baseUrl/jobs/task-status-super";
  static const String myProfile = "$_baseUrl/users/me";
  static const String blockList = "$_baseUrl/users/block-user";
  static const String downloadUserCSV = "$_baseUrl/users/downloadUsersCSV";
  static const String downloadTasklistCSV = "$_baseUrl/tasks/task-csv";
  static const String assignedTask = "$_baseUrl/tasks/assigned-task/";
  static const String editProfile = "$_baseUrl/users/update-user/";
  static const String employeeHome = "$_baseUrl/tasks/my-today-task";
  static const String myTasks = "$_baseUrl/tasks/my-task/";
  static const String updateProfileImage = "$_baseUrl/users/update-image";
  static const String updatePassword = "$_baseUrl/users/update-password";
  static const String updateProgress = "$_baseUrl/jobs/update-progress/";
  static const String reportIssue = "$_baseUrl/tasks/issue/";
}
