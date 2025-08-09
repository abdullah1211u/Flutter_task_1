import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/user_controller.dart';
import 'view/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using ChangeNotifierProvider to make the UserController available
    // to all widgets in the subtree.
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: MaterialApp(
        title: 'MVC Home work',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const UserProfilePage(),
      ),
    );
  }
}
