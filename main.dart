import 'package:flutter/material.dart';
import 'login_activity.dart';
import 'sign_up_activity.dart';
import 'forgot_password_activity.dart';
import 'main_activity.dart';
import 'bmi_calculator.dart';
import 'health_condition_screen.dart';
import 'type_of_body_screen.dart';
import 'body_goal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitSync',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BackgroundWrapper(child: LogInActivity()),
        '/main': (context) => const BackgroundWrapper(child: MainActivity()),
        '/forgotPassword': (context) => const BackgroundWrapper(child: ForgotPasswordActivity()),
        '/signUp': (context) => const BackgroundWrapper(child: SignUpActivity()),
        '/bmiCalculator': (context) => const BackgroundWrapper(child: BMICalculator()),
        '/healthCondition': (context) => const BackgroundWrapper(child: HealthConditionScreen(gender: 'male')),
        '/typeOfBody': (context) => const BackgroundWrapper(child: BodyTypeSelectionScreen()),
        '/goalBody': (context) => const BackgroundWrapper(child: GoalBodyScreen()),
      },
    );
  }
}

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/image1.jpg',
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
