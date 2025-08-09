import 'package:flutter/material.dart';

// The data model for a User.
class User {
  String name;
  int age;
  String localImage;
  String networkImage;
  IconData profileIcon;

  User({
    required this.name,
    required this.age,
    required this.localImage,
    required this.networkImage,
    required this.profileIcon,
  });
}
