import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';
import 'summary_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the UserController instance provided by ChangeNotifierProvider.
    final userController = Provider.of<UserController>(context);
    final user = userController.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 71, 11),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Displaying the user's name.
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),

              // Displaying the profile picture from a network URL.
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    Image.asset(
                      'assets/images/profile2.png',
                    ).image /*  NetworkImage(user.networkImage) */, // onBackgroundImageError: (exception, stackTrace) {
                //   // Fallback to a local asset if the network image fails.
                //   Image.asset('assets/images/profile.png');
                // },
              ),
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: Image.asset('assets/images/profile.png').image,
              //     ),
              //     shape: BoxShape.circle,
              //   ),
              // ),
              const SizedBox(height: 10),

              // Displaying an SVG icon.
              const SizedBox(height: 20),

              // Displaying the age counter.
              Text(
                'Age: ${user.age}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),

              // Row for the increment and decrement buttons.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      userController.incrementAge();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Age increased',
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 71, 11),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      userController.decrementAge();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Age decreased',
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 71, 11),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Button to show a reset confirmation dialog.
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Confirm Reset?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 71, 11),
                          ),
                        ),
                        content: const Text(
                          'reset age',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 71, 11),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 71, 11),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 71, 11),
                              ),
                            ),
                            onPressed: () {
                              userController.resetAge();
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Age has been reset',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 235, 71, 11),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Reset Age?',
                  style: TextStyle(color: Color.fromARGB(255, 235, 71, 11)),
                ),
              ),
              const SizedBox(height: 20),

              // Button to navigate to the SummaryPage.
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              SummaryPage(userName: user.name, age: user.age),
                    ),
                  );
                },
                child: const Text(
                  'Go to Summary Page',
                  style: TextStyle(color: Color.fromARGB(255, 235, 71, 11)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
