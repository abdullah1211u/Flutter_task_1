import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/donor_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Blood Bank App',
      debugShowCheckedModeBanner: false,
      home: DonorListView(),
    );
  }
}
