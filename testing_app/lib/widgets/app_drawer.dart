import '/views/cart_screen.dart';
import '/views/favorites_screen.dart';
import '/views/home_screen.dart';
import '/views/profile_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false, // No back button
          ),
          const Divider(),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          }),
          const Divider(),
          buildListTile('Profile', Icons.person, () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
          }),
          const Divider(),
          buildListTile('My Favorites', Icons.favorite, () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FavoritesScreen()));
          }),
          const Divider(),
          buildListTile('My Cart', Icons.shopping_cart, () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
          }),
        ],
      ),
    );
  }
}
