import '/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body:
          user == null
              ? const Center(child: Text('Not logged in.'))
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AuthController>(
                          context,
                          listen: false,
                        ).logout();
                        // Pop until we are at the root
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
    );
  }
}
