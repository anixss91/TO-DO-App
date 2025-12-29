import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskController controller = Get.find(); //get exist controller
  final TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int taskIndex = Get.arguments as int; //get passed index
    editController.text = controller.tasks[taskIndex].title; //pree fill title

    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(hintText: 'Edit Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.editTasks(taskIndex, editController.text);
                Get.back(); //get back to home
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
