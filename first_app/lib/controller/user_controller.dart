import 'package:flutter/material.dart';
import '../model/user_model.dart';

// The controller class that manages the state of the User model.
class UserController with ChangeNotifier {
  // Initializing the User model with some default data.
  final User _user = User(
    name: 'Md Abdullah',
    age: 0,
    localImage: 'assets/images/profile.jpg',
    networkImage:
        'https://thumbs.dreamstime.com/b/boy-profile-pic-377717719.jpg',
    profileIcon: Icons.person,
  );

  // Getter for the user data.
  User get user => _user;

  // Function to increment the age.
  void incrementAge() {
    _user.age += 1;
    // Notifies listeners (like the UI) that the data has changed.
    notifyListeners();
  }

  // Function to decrement the age.
  void decrementAge() {
    _user.age--;
    notifyListeners();
  }

  // Function to reset the age to 0.
  void resetAge() {
    _user.age = 0;
    notifyListeners();
  }
}
