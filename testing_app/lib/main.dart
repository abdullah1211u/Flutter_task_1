import '/controllers/auth_controller.dart';
import '/controllers/cart_controller.dart';
import '/controllers/product_controller.dart';
import '/views/auth/login_screen.dart';
import '/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider to make controllers available throughout the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: MaterialApp(
        title: 'Online Pharmacy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 75, 177, 236),
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 103, 179, 220),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthController>(
          builder: (context, authController, _) {
            // If user is logged in, show HomeScreen, otherwise show LoginScreen
            return authController.user != null
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
      ),
    );
  }
}
