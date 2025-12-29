import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/completed_task_screen.dart';
import './screens/edit_task_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To_Do List App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home', //start with home screen
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/edit', page: () => EditTaskScreen()),
        GetPage(name: '/completed', page: () => CompletedTaskScreen()),
      ],
    );
  }
}
