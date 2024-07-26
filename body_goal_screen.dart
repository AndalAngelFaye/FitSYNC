import 'package:flutter/material.dart';
import 'login_activity.dart';

class GoalBodyScreen extends StatefulWidget {
  const GoalBodyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoalBodyScreenState createState() => _GoalBodyScreenState();
}

class _GoalBodyScreenState extends State<GoalBodyScreen> {
  bool isCardioPressed = false;
  bool isGainMusclePressed = false;
  bool isLoseWeightPressed = false;
  String bodyGoal = '';
  bool isHoveredCardio = false;
  bool isHoveredGainMuscle = false;
  bool isHoveredLoseWeight = false;

  void _resetImageViews() {
    setState(() {
      isCardioPressed = false;
      isGainMusclePressed = false;
      isLoseWeightPressed = false;
    });
  }

  void _onContinue() {
    if (isCardioPressed || isGainMusclePressed || isLoseWeightPressed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogInActivity()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one choice')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Body'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top image
            MouseRegion(
              onEnter: (_) => setState(() { isHoveredCardio = true; }),
              onExit: (_) => setState(() { isHoveredCardio = false; }),
              child: GestureDetector(
                onTap: () {
                  _resetImageViews();
                  setState(() {
                    isCardioPressed = true;
                    bodyGoal = 'Fit';
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isCardioPressed ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/cardio.jpg'), 
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      if (isCardioPressed || isHoveredCardio)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                    ],
                  ),
                  height: 250, // Same size as bottom images
                  width: 700, // Same size as bottom images
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Cardio',
                          style: TextStyle(
                            color: isCardioPressed ? Colors.white : (isHoveredCardio ? Colors.white : Colors.black),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isHoveredCardio)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3), 
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            // Bottom images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) => setState(() { isHoveredGainMuscle = true; }),
                    onExit: (_) => setState(() { isHoveredGainMuscle = false; }),
                    child: GestureDetector(
                      onTap: () {
                        _resetImageViews();
                        setState(() {
                          isGainMusclePressed = true;
                          bodyGoal = 'Gain Muscle';
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isGainMusclePressed ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/gain_muscle.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            if (isGainMusclePressed || isHoveredGainMuscle)
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                          ],
                        ),
                        height: 200, // Same size as top image
                        width: 200, // Same size as top image
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                'Gain Muscle',
                                style: TextStyle(
                                  color: isGainMusclePressed ? Colors.white : (isHoveredGainMuscle ? Colors.white : Colors.black),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (isHoveredGainMuscle)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) => setState(() { isHoveredLoseWeight = true; }),
                    onExit: (_) => setState(() { isHoveredLoseWeight = false; }),
                    child: GestureDetector(
                      onTap: () {
                        _resetImageViews();
                        setState(() {
                          isLoseWeightPressed = true;
                          bodyGoal = 'Lose Weight';
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isLoseWeightPressed ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/loseweight.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            if (isLoseWeightPressed || isHoveredLoseWeight)
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                          ],
                        ),
                        height: 200, // Same size as top image
                        width: 200, // Same size as top image
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                'Lose Weight',
                                style: TextStyle(
                                  color: isLoseWeightPressed ? Colors.white : (isHoveredLoseWeight ? Colors.white : Colors.black),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (isHoveredLoseWeight)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
