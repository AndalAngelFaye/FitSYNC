import 'package:flutter/material.dart';

class ForgotPasswordActivity extends StatefulWidget {
  const ForgotPasswordActivity({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordActivityState createState() => _ForgotPasswordActivityState();
}

class _ForgotPasswordActivityState extends State<ForgotPasswordActivity> {
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() async {
    String email = _emailController.text.trim();
    if (email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a valid email address"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ElevatedButton(
                    onPressed: _resetPassword,
                    child: const Text("Send Reset Link"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
