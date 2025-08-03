import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_work_1/view/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: FirstPage());
  }
}
