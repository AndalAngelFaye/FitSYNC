// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'workout.dart'; 
import 'FitnessFuel.dart'; 
import 'settings.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WorkoutScreen(), 
    Fitnessfuel(), 
    const SettingsScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            // Handle navigation or profile action here
          },
        ),
        title: const Text('FitSync'),
        backgroundColor: const Color.fromRGBO(249, 247, 247, 1),
      ),
      body: _pages[_selectedIndex], // Show selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'FitnessFuel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromRGBO(172, 18, 24, 1), // Set the background color to black
        selectedItemColor: Colors.white, // Set the color of the selected item to white
        unselectedItemColor: Colors.grey, // Set the color of the unselected items to grey
      ),
    );
  }
}
