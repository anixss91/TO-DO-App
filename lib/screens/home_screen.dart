import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class HomeScreen extends StatelessWidget {
  final Controller = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xFF4FACFE),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4FACFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        //All TextField and TextFormField widgets will automatically have
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.check_circle),
            onPressed: () => Get.toNamed('/completed'),
          ),
          title: Text('To-Do List', style: TextStyle(color: Colors.white)),
          actions: [Icon(Icons.settings)],
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
              begin: Alignment.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'add a Task'),
                  onSubmitted: (value) {
                    Controller.addTask(value);
                    textController.clear(); //clear the input text when submit
                  },
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Controller.addTask(textController.text);
                    textController.clear();
                  },
                  child: Text('Add'),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: Controller.tasks.length,
                      itemBuilder: (context, index) => AnimatedOpacity(
                        opacity: 1,
                        duration: Duration(milliseconds: 500),
                        child: Dismissible(
                          key: Key(Controller.tasks[index].title),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (_) => Controller.deleteTask(index),
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: Text(
                                Controller.tasks[index].title,
                                style: TextStyle(
                                  decoration: Controller.tasks[index].isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              leading: Checkbox(
                                value: Controller.tasks[index].isDone,
                                onChanged: (_) => Controller.toggleTask(index),
                              ),
                              onTap: () =>
                                  Get.toNamed('/edit', arguments: index),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
