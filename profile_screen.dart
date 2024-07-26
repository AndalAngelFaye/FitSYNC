import 'package:flutter/material.dart';
import 'login_activity.dart';
import 'settings.dart'; // Ensure this import is correct

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required String bmiResult});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade200, 
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(231, 25, 25, 1), 
              child: const UserAccountsDrawerHeader(
                accountName: Text(
                  "Users",
                  style: TextStyle(color: Colors.white), 
                ),
                accountEmail: Text(
                  "Users@example.com",
                  style: TextStyle(color: Colors.white), 
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 33, 37, 1), 
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.white, 
              leading: const Icon(Icons.info, color: Color.fromRGBO(243, 33, 33, 1)), 
              title: const Text('Profile Info', style: TextStyle(color: Colors.black)), 
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              tileColor: Colors.white, 
              leading: const Icon(Icons.settings, color: Color.fromARGB(255, 224, 20, 20)), 
              title: const Text('Settings', style: TextStyle(color: Colors.black)), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            const Divider(color: Color.fromRGBO(240, 26, 26, 1)), 
            ListTile(
              tileColor: Colors.white, 
              leading: const Icon(Icons.logout, color: Color.fromRGBO(243, 33, 37, 1)), 
              title: const Text('Logout', style: TextStyle(color: Colors.black)), 
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInActivity()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
