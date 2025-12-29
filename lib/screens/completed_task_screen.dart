import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/task_models.dart';
import '../controllers/task_controller.dart';

class CompletedTaskScreen extends StatelessWidget {
  final TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks')),
      body: Obx(
        () => controller.completedTasks.isEmpty
            ? Center(child: Text('No completed tasks yet!'))
            : ListView.builder(
                itemCount: controller.completedTasks.length,
                itemBuilder: (context, index) {
                  final originalIndex = controller.tasks.indexWhere(
                    (task) =>
                        task ==
                        controller
                            .completedTasks[index], //find original index for toggling
                  );
                  return Card(
                    child: ListTile(
                      title: Text(controller.completedTasks[index].title),
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      onTap: () =>
                          controller.toggleTask(originalIndex), //unmark as Done
                    ),
                  );
                },
              ),
      ),
    );
  }
}
