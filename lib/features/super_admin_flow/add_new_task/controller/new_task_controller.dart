import 'package:get/get.dart';

class NewTaskController extends GetxController {
  RxList taskChecklist = ["Get Wormd up"].obs;
  RxList taskToolsList = ["Hammer"].obs;

  void addChecklist(String title) {
    if (title.isNotEmpty) {
      taskChecklist.add(title);
    }
  }

  void deleteChecklist(String title) {
    taskChecklist.remove(title);
  }

  void addTools(String title) {
    if (title.isNotEmpty) {
      taskToolsList.add(title);
    }
  }

  void deleteTools(String title) {
    taskToolsList.remove(title);
  }
}
