import 'package:get/get.dart';
import 'package:task_management_app/models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void updateTask(int index, Task task) {
    tasks[index] = task;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  List<Task> getTasksByCategory(String category) {
    return tasks.where((task) => task.category == category).toList();
  }

  List<Task> getTasksByPriority(int priority) {
    return tasks.where((task) => task.priority == priority).toList();
  }
}
