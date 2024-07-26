import 'package:flutter/material.dart';
import 'workout.dart'; 
import 'FitnessFuel.dart'; 
import 'settings.dart'; 
import 'profile_screen.dart'; 

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  MainActivityState createState() => MainActivityState();
}

class MainActivityState extends State<MainActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('FitSync'),
        backgroundColor: Color.fromRGBO(255, 244, 238, 1),
      ),
      drawer: const ProfileScreen(bmiResult: ''), 
      body: _pages[_selectedIndex], 
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
        backgroundColor: const Color.fromRGBO(217, 38, 38, 1), 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.grey, 
      ),
    );
  }
}
