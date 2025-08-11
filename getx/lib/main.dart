import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/pages.dart';
import 'package:getx/pages/first.dart';

import 'components/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Example',
      home: FirstPage(),
      getPages: Pages.pages,
      initialRoute: Routes.home,
    );
  }
}
