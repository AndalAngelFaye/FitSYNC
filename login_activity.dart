// ignore_for_file: unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_activity.dart';
import 'package:flutter_application_1/main_screen.dart'; 

class LogInActivity extends StatefulWidget {
  const LogInActivity({super.key});

  @override
  _LogInActivityState createState() => _LogInActivityState();
}

class _LogInActivityState extends State<LogInActivity> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isValidEmail(String email) {
   
    final RegExp emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegExp.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    
    final RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty) {
      if (_isValidEmail(email)) {
        if (password.isNotEmpty) {
          if (_isValidPassword(password)) {
            
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainActivity()), 
            );
          } else {
            
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incorrect password"),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password Cannot Be Empty"),
          ));
        }
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid email"),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email Cannot Be Empty"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Picture2.png', width: 200, height: 200),
              const SizedBox(height: 10),
              const Text(
                "FitSync",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', 
                  color: Colors.black, 
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.hovered)) {
                        return const Color.fromRGBO(228, 29, 29, 1); // Color when hovered
                      }
                      return Colors.black; 
                    },
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // Text color
                  minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)), // Button size
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white), // Change text color to white
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
                child: const Text("Forgot Password?"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
