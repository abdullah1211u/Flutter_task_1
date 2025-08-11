import '/models/user.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier {
  User? _user;
  // In a real app, this would be stored securely on a server.
  final List<User> _registeredUsers = [];
  // Store passwords temporarily. In a real app, use hashing.
  final Map<String, String> _userPasswords = {};

  User? get user => _user;

  // Simulates a signup process
  Future<void> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (_registeredUsers.any((user) => user.email == email)) {
      throw Exception('An account already exists for that email.');
    }
    final newUser = User(
      id: DateTime.now().toIso8601String(),
      name: name,
      email: email,
    );
    _registeredUsers.add(newUser);
    _userPasswords[email] = password; // Insecure: for demo only
    _user = newUser;
    notifyListeners();
  }

  // Simulates a login process
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    // Find user by email
    final userIndex = _registeredUsers.indexWhere(
      (user) => user.email == email,
    );

    if (userIndex == -1) {
      throw Exception('User not found. Please register.');
    }

    // Check password (insecurely for this demo)
    if (_userPasswords[email] != password) {
      throw Exception('Incorrect password.');
    }

    _user = _registeredUsers[userIndex];
    notifyListeners();
  }

  // Simulates a logout process
  void logout() {
    _user = null;
    notifyListeners();
  }

  // Toggles a product in the user's favorites
  void toggleFavorite(String productId) {
    if (_user != null) {
      if (_user!.favoriteProductIds.contains(productId)) {
        _user!.favoriteProductIds.remove(productId);
      } else {
        _user!.favoriteProductIds.add(productId);
      }
      notifyListeners();
    }
  }

  bool isFavorite(String productId) {
    return _user?.favoriteProductIds.contains(productId) ?? false;
  }
}
