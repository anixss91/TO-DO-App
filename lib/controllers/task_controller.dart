import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_models.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs; //reactive list:ui updates when state change
  //This is a Dart getter that returns a filtered list of completed tasks. It:

  List<Task> get completedTasks => tasks.where((task) => task.isDone).toList();

  @override
  void onInit() {
    //its a getx methode that runs the functions inside only when the getx controller is created
    super.onInit();
    loadTasks();
  }

  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title));
      saveTasks();
    }
  }

  void toggleTask(int index) {
    tasks[index].isDone =
        !tasks[index].isDone; //invert the boolean value(done or not done)
    tasks.refresh(); //forc ui update
    saveTasks();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  void editTasks(int index, String newTitle) {
    tasks[index].title = newTitle;
    tasks.refresh();
    saveTasks();
  }

  //save to storage
  void saveTasks() async {
    final prefs =
        await SharedPreferences.getInstance(); //wait the storage to get ready
    final taskList = tasks
        .map((t) => t.toJson())
        .toList(); //shared preferences cant save objects ths why we did this
    prefs.setString(
      'tasks',
      jsonEncode(taskList),
    ); // we convert it back to json for not taking much memory
  }

  //load from storage
  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskString = prefs.getString('tasks');
    if (taskString != null) {
      final taskList = jsonDecode(taskString) as List;
      tasks.value = taskList
          .map((json) => Task.fromJson(json))
          .toList(); //load from memory convert the back to object
    }
  }
}
