// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  void _calculateBMI() {
    double heightCm = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (heightCm > 0 && weight > 0) {
      double heightM = heightCm / 100;  
      double bmi = weight / (heightM * heightM);  // Calculate BMI
      setState(() {
        _bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
        _bmiCategory = _getBMICategory(bmi);
      });

      // Navigate to HealthConditionScreen after displaying the BMI result
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/healthCondition');
      });
    } else {
      setState(() {
        _bmiResult = 'Please enter valid height and weight';
        _bmiCategory = '';
      });
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.black.withOpacity(0.7), 
                elevation: 8, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Height (cm)",
                          prefixIcon: const Icon(Icons.height, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          hintStyle: const TextStyle(color: Color.fromARGB(255, 13, 13, 13)), 
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Weight (kg)",
                          prefixIcon: const Icon(Icons.monitor_weight, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          hintStyle: const TextStyle(color: Color.fromARGB(255, 13, 13, 13)), 
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _calculateBMI,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                          minimumSize: const Size(150, 50), // Button size
                        ),
                        child: const Text("Calculate BMI"),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _bmiResult,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        _bmiCategory,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
