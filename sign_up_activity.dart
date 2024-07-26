import 'package:flutter/material.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpActivityState createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isEmailValid(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@(gmail\.com|batstate-u\.edu\.ph)$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool _hasMinLength(String password) => password.length >= 8;
  bool _hasUppercase(String password) => password.contains(RegExp(r'[A-Z]'));
  bool _hasLowercase(String password) => password.contains(RegExp(r'[a-z]'));
  bool _hasNumber(String password) => password.contains(RegExp(r'[0-9]'));

  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty) {
      if (password == confirmPassword) {
        if (_hasMinLength(password) &&
            _hasUppercase(password) &&
            _hasLowercase(password) &&
            _hasNumber(password)) {
          if (_isEmailValid(email)) {
            Navigator.pushReplacementNamed(context, '/bmiCalculator');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Enter a valid email address ending with gmail.com or batstate-u.edu.ph"),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password must contain an uppercase letter, a lowercase letter, a number, and be at least 8 characters long"),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Passwords do not match"),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("All fields are required"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.black.withOpacity(0.7), // Semi-transparent black background
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "USER REGISTRATION",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email, color: Color.fromRGBO(26, 22, 22, 1)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            hintText: "First Name",
                            prefixIcon: Icon(Icons.person, color: Color.fromRGBO(26, 22, 22, 1)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Icon(Icons.person, color: Color.fromRGBO(26, 22, 22, 1)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(0, 0, 0, 1)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 0, 0, 0)),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password must contain:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  _hasLowercase(_passwordController.text)
                                      ? Icons.check
                                      : Icons.close,
                                  color: _hasLowercase(_passwordController.text)
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "At least one lowercase letter",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  _hasUppercase(_passwordController.text)
                                      ? Icons.check
                                      : Icons.close,
                                  color: _hasUppercase(_passwordController.text)
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "At least one uppercase letter",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  _hasNumber(_passwordController.text)
                                      ? Icons.check
                                      : Icons.close,
                                  color: _hasNumber(_passwordController.text)
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "At least one number",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  _hasMinLength(_passwordController.text)
                                      ? Icons.check
                                      : Icons.close,
                                  color: _hasMinLength(_passwordController.text)
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Minimum 8 characters",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromRGBO(27, 23, 23, 1),
                            backgroundColor: const Color.fromRGBO(246, 245, 245, 1),
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
