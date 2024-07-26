import 'package:flutter/material.dart';

class HealthConditionScreen extends StatefulWidget {
  final String gender;

  const HealthConditionScreen({super.key, required this.gender});

  @override
  // ignore: library_private_types_in_public_api
  _HealthConditionScreenState createState() => _HealthConditionScreenState();
}

class _HealthConditionScreenState extends State<HealthConditionScreen> {
  final Map<String, bool> _healthConditions = {
    'Cardio Condition': false,
    'Respiratory Condition': false,
    'Joint Issues': false,
    'Hypertension': false,
    'Osteoporosis': false,
    'Pregnancy': false,
  };

  bool _termsAccepted = false;

  void _onCheckBoxChanged(String condition, bool? value) {
    setState(() {
      if (value != null) {
        _healthConditions[condition] = value;
      }
    });
  }

  void _onContinue() {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the Terms and Conditions')),
      );
      return;
    }

   
    _healthConditions.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .lastWhere((condition) => condition.isNotEmpty, orElse: () => 'No health condition chosen');

    

   
    Navigator.pushNamed(context, '/typeOfBody');
  }

  bool get _canAcceptTerms {
    int selectedConditions = _healthConditions.values.where((v) => v).length;
    bool isPregnancySelected = _healthConditions['Pregnancy'] ?? false;
    return !isPregnancySelected && (selectedConditions == 0 || selectedConditions == 2);
  }

  void _showConsultDoctorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consult Your Doctor'),
          content: const Text(
            'It is advised to consult your doctor before proceeding with the use of this app if you have any health conditions selected. Your safety is important to us.',
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms and Conditions'),
          content: const Text(
            'Before engaging in any physical activities suggested or provided by FitSYNC App, it is your responsibility to assess your health condition and suitability for such activities. Consultation with a qualified healthcare professional is recommended, especially if you have any pre-existing medical conditions, injuries, or concerns.\n\n'
            'FITSYNC App is designed to provide general fitness information and guidance. It is not a substitute for professional advice, diagnosis, or treatment. You should always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.\n\n'
            'If you are under the age of 18, you must obtain parental or legal guardian consent before using the application.\n\n'
            'By checking the box indicating that you have read and agree to these terms, you confirm that you understand and accept the risks associated with physical activities and release FITSYNC App from any liability related to injuries or damages that may occur while using the application.',
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Condition'),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Health Conditions",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ..._healthConditions.keys.map((condition) {
                        if (condition == 'Pregnancy' && widget.gender == 'Male') {
                          return const SizedBox.shrink(); 
                        }
                        return CheckboxListTile(
                          title: Text(
                            condition,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _healthConditions[condition],
                          onChanged: (value) => _onCheckBoxChanged(condition, value),
                          checkColor: Colors.black, // Color of the check
                          activeColor: Colors.white, // Color of the box when checked
                        );
                      }),
                      const SizedBox(height: 20),
                      CheckboxListTile(
                        title: const Text(
                          'I agree to the Terms and Conditions',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _termsAccepted,
                        onChanged: _canAcceptTerms
                            ? (value) {
                                setState(() {
                                  _termsAccepted = value ?? false;
                                });
                                _showTermsDialog();
                              }
                            : (value) {
                                _showConsultDoctorDialog();
                              },
                        checkColor: Colors.black, // Color of the check
                        activeColor: Colors.white, // Color of the box when checked
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _onContinue,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.white, 
                          minimumSize: const Size(150, 50), 
                        ),
                        child: const Text('Continue'),
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
