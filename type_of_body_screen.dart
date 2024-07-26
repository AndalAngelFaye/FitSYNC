import 'package:flutter/material.dart';
import 'body_goal_screen.dart';

class BodyTypeSelectionScreen extends StatefulWidget {
  const BodyTypeSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BodyTypeSelectionScreenState createState() => _BodyTypeSelectionScreenState();
}

class _BodyTypeSelectionScreenState extends State<BodyTypeSelectionScreen> {
  String selectedBodyType = '';
  String hoveredBodyType = '';

  void _selectBodyType(String type) {
    setState(() {
      selectedBodyType = type;
    });
    
  }

  void _onContinue() {
    if (selectedBodyType.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GoalBodyScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a body type.')),
      );
    }
  }

  Widget _buildBodyTypeButton(String type, String imagePath) {
    return InkWell(
      onTap: () {
        _selectBodyType(type);
      },
      onHover: (isHovered) {
        setState(() {
          hoveredBodyType = isHovered ? type : '';
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedBodyType == type
                ? Colors.blue
                : (hoveredBodyType == type ? Colors.red : Colors.grey),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: selectedBodyType == type
                ? ColorFilter.mode(Colors.blue.withOpacity(0.5), BlendMode.srcOver)
                : null,
          ),
        ),
        child: Center(
          child: Text(
            type,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black54, 
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Body Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Your Fitness Journey Starts Now',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Your Current Body',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildBodyTypeButton('Ectomorph', 'assets/ectomorph.jpg'),
                  _buildBodyTypeButton('Mesomorph', 'assets/mesomorph.jpg'),
                  _buildBodyTypeButton('Endomorph', 'assets/endomorph.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onContinue,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
