import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Define your workout data structure
class Workout {
  final String name;
  final String picture;
  final String setsReps;
  final String description;
  final String? videoPath;
  bool completed;

  Workout({
    required this.name,
    required this.picture,
    required this.setsReps,
    required this.description,
    this.videoPath,
    this.completed = false,
  });
}

final Map<String, List<Workout>> workoutPlans = {
  'Obesity Exercise': [
    Workout(
      name: 'weighted_stepup',
      picture: 'weightedstepup.webp',
      setsReps: '3 x 12',
      description: 'Weighted step-ups target your legs and glutes. This exercise involves stepping up onto an elevated surface while holding weights, which helps build lower body strength and stability',
      videoPath: 'weighted_stepup.mp4',
    ),
    Workout(
      name: 'standingreachupback_rotation',
      picture: 'standingreach.png',
      setsReps: '3 x 15',
      description: 'This stretch focuses on your upper body. It involves reaching up and rotating your back, which helps improve flexibility and mobility in your shoulders and spine.',
      videoPath: 'standingreachupback_rotation.mp4',
    ),
    Workout(
      name: 'standing_quadriceps_stretch',
      picture: 'quadriceps.jpg',
      setsReps: '3 x 1 min',
      description: 'This stretch targets the thigh muscles (quadriceps). Standing on one leg, you pull the other leg up behind you, stretching the front of the thigh and improving flexibility.',
      videoPath: 'standing_quadriceps_stretch.mp4',
    ),
    Workout(
      name: 'arminvetical_stretch',
      picture: 'armvert.jpg',
      setsReps: '3 x 1 min',
      description: 'This stretch focuses on the shoulder muscles. You raise your arm vertically and hold it, which helps to increase shoulder flexibility and reduce muscle tension.',
      videoPath: 'arminvetical_stretch.mp4',
    ),
     Workout(
      name: 'seated_cablerow',
      picture: 'seated_cable.jpg',
      setsReps: '3 x 1 min',
      description: 'This exercise targets your back muscles. Sitting down with your feet braced, you pull a weighted cable towards your torso, which helps strengthen the middle and upper back.',
      videoPath: 'seated_cablerow.mp4',
    ),
     Workout(
      name: 'kettlebell_twoarmrow',
      picture: 'kettlebell.jpg',
      setsReps: '3 x 1 min',
      description: 'This exercise targets the back and arm muscles. Using a kettlebell, you perform a rowing motion with both arms, which helps improve strength and stability.',
      videoPath: 'kettlebell_twoarmrow.mp4',
    ),
     Workout(
      name: 'aboveheead_cheststretch',
      picture: 'abovehead.webp',
      setsReps: '3 x 1 min',
      description: 'This stretch focuses on the chest muscles. Raising your arms overhead and stretching helps to open up the chest and improve flexibility.',
      videoPath: 'abovehead_cheststretch.mp4',
    ),
     Workout(
      name: 'backtwist_stretch',
      picture: 'backtwist.jpg',
      setsReps: '3 x 1 min',
      description: 'This stretch targets the muscles in the back and spine. Sitting or standing, you twist your torso to one side, which helps improve spinal mobility and reduce tension.',
      videoPath: 'backtwist_stretch.mp4',
    ),
     Workout(
      name: 'air_squat',
      picture: 'airsquats.png',
      setsReps: '3 x 1 min',
      description: 'Air squats focus on the lower body, particularly the quadriceps, hamstrings, and glutes. This bodyweight exercise involves squatting down and standing back up without additional weights.',
      videoPath: 'air_squat.mp4',
    ),
     Workout(
      name: 'dumbbell_fronttracklunge',
      picture: 'dumbbell_lunge.jpg',
      setsReps: '3 x 1 min',
      description: 'This exercise targets the legs and glutes. Holding dumbbells at shoulder level, you step forward into a lunge, which helps build lower body strength and stability.',
      videoPath: 'dumbbell_frontracklunge.mp4',
    ),
    
  ],
  'Underweight Exercise': [
    Workout(
      name: 'squats',
      picture: 'squats.jpg',
      setsReps: '4 x 10',
      description: 'Squats are a foundational exercise that targets the lower body, particularly the quadriceps, hamstrings, and glutes. They help build strength and muscle mass in the legs and hips.',
      videoPath: 'squat.mp4',
    ),
    Workout(
      name: 'bench_kneeling_latstretch',
      picture: 'bench_kneeling.jpg',
      setsReps: '3 x 12 per leg',
      description: 'This stretch targets the latissimus dorsi muscles in the back. Kneeling on a bench and stretching your arms forward helps improve flexibility and reduce muscle tension in the back.',
      videoPath: 'bench_kneeling_latstretch.mp4',
    ),
    Workout(
      name: 'single_leg_deadliftandright',
      picture: 'deadlift.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the hamstrings, glutes, and core. Balancing on one leg, you bend forward at the hips while keeping your back straight, which helps improve strength and stability.',
      videoPath: 'single_leg_deadliftleftandright.mp4.',
    ),
     Workout(
      name: 'side_tilts',
      picture: 'sidetilts.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the oblique muscles in the abdomen. Standing or sitting, you tilt your torso to the side, which helps improve core strength and flexibility.',
      videoPath: 'side_tilts_stretch.mp4.',
    ),
     Workout(
      name: 'side_lying_legraiseleftandright',
      picture: 'Side_Lying.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the outer thigh muscles (abductors). Lying on your side, you lift your top leg upwards, which helps strengthen and tone the outer thighs.',
      videoPath: 'side_lying_legraiseleftandright.mp4.',
    ),
     Workout(
      name: 'side_plank',
      picture: 'sideplank.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the core muscles, particularly the obliques. Balancing on one arm and the side of one foot, you hold a plank position, which helps improve core stability and strength.',
      videoPath: 'side_plank.mp4.',
    ),
     Workout(
      name: 'dumbbell_bent_over_row',
      picture: 'Bent_over.webp',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the back muscles. Bending over with a flat back, you pull dumbbells towards your torso, which helps strengthen the upper and middle back.',
      videoPath: 'dumbbell_bent_over_row.mp4.',
    ),
     Workout(
      name: 'cablebar_latpulldown',
      picture: 'cablebar.webp',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the latissimus dorsi muscles in the back. Sitting down and pulling a cable bar down towards your chest helps improve upper body strength and muscle mass.',
      videoPath: 'cablebar_latpulldown.mp4.',
    ),
     Workout(
      name: 'barbell_deadlift',
      picture: 'deadlift.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the lower back, glutes, and hamstrings. Lifting a barbell from the ground to a standing position helps build strength and muscle mass in the posterior chain.',
      videoPath: 'barbell_deadlift.mp4.',
    ),
     Workout(
      name: 'dumbbell_frontsquat',
      picture: 'frontsquat.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the quadriceps, glutes, and core. Holding dumbbells at shoulder height, you perform a squat, which helps build lower body strength and stability.',
      videoPath: 'dumbbell_frontsquat.mp4.',
    ),
  ],
  'Normal Weight Exercise': [
    Workout(
      name: 'barbellbentoverwidegriprow',
      picture: 'barbell_bent_over.jpg',
      setsReps: '3 x 15',
      description: 'This exercise targets the upper back and shoulders. Using a barbell with a wide grip, you perform a rowing motion while bent over, which helps build back strength and muscle definition.',
      videoPath: 'barbellbentoverwidegriprow.mp4',
    ),
    Workout(
      name: 'dumbbell_chestfly',
      picture: 'chestfly.jpg',
      setsReps: '3 x 30 sec',
      description: 'This exercise targets the chest muscles. Lying on a bench, you open your arms wide with dumbbells and then bring them together, which helps build chest strength and definition.',
      videoPath: 'dumbbell_chestfly.mp4',
    ),
    Workout(
      name: 'plank',
      picture: 'plank.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the core muscles. Holding a plank position on your hands or elbows helps improve core stability and strength.',
       videoPath: 'plank.mp4',
    ),
    Workout(
      name: 'barbell_curl',
      picture: 'barbellcurl.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the biceps. Using a barbell, you curl the weight up towards your shoulders, which helps build bicep strength and muscle mass.',
      videoPath: 'barbell_curl.mp4',
    ),
     Workout(
      name: 'dumbbell_incline_benchpress',
      picture: 'incline.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the upper chest and shoulders. Lying on an incline bench, you press dumbbells upwards, which helps build upper body strength and muscle definition.',
      videoPath: 'dumbbell_incline_benchpress.mp4',
    ),
    Workout(
      name: 'dumbbell_russiantwist',
      picture: 'russian.webp',
      setsReps: '3 x 20',
      description: 'This exercise targets the oblique muscles. Sitting on the ground with your feet lifted, you twist your torso while holding a dumbbell, which helps improve core strength and stability.',
      videoPath: 'dumbbell_russiantwist.mp4',
    ),
     Workout(
      name: 'dumbbellchest_press',
      picture: 'dumbbellchest.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the chest muscles. Lying on a bench, you press dumbbells upwards, which helps build chest strength and muscle definition.',
      videoPath: 'dumbbellchest_press.mp4',
    ),
    Workout(
      name: 'glute_bridge',
      picture: 'glute.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the glutes and lower back. Lying on your back with your feet on the ground, you lift your hips upwards, which helps build glute strength and stability.',
      videoPath: 'glute_bridge.mp4',
    ),
     Workout(
      name: 'incline_pushup',
      picture: 'pushup.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the chest and triceps. Performing a push-up with your hands elevated on a bench or step helps build upper body strength and muscle definition.',
      videoPath: 'incline_pushup.mp4',
    ),
     Workout(
      name: 'leg_extension_machine',
      picture: 'extension.jpg',
      setsReps: '3 x 20',
      description: 'This exercise targets the quadriceps. Sitting on a leg extension machine, you extend your legs forward, which helps build strength and muscle mass in the thighs.',
      videoPath: 'leg_extension_machine.mp4',
    ),
  ],
};

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<ExerciseType> exerciseTypes = [
    ExerciseType(name: 'Obesity Exercise', isLocked: false, imagePath: 'assets/obese.jpg'),
    ExerciseType(name: 'Underweight Exercise', isLocked: false, imagePath: 'assets/underweight.jpg'),
    ExerciseType(name: 'Normal Weight Exercise', isLocked: false, imagePath: 'assets/normal.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: exerciseTypes.map((type) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: type.isLocked
                      ? null
                      : () => _onExerciseTypeButtonClick(type.name),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Make the button background transparent
                    elevation: 0, // Remove the button shadow
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(type.imagePath),
                        fit: BoxFit.cover, // Adjust how the image fits within the container
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        type.name,
                        style: const TextStyle(
                          color: Color.fromRGBO(7, 7, 7, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _onExerciseTypeButtonClick(String exerciseTypeName) async {
    final workouts = workoutPlans[exerciseTypeName] ?? [];

    final isCompleted = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutDetailScreen(
          exerciseTypeName: exerciseTypeName,
          workouts: workouts,
        ),
      ),
    );

    if (isCompleted != null && isCompleted) {
      setState(() {
        final currentIndex = exerciseTypes.indexWhere((type) => type.name == exerciseTypeName);
        if (currentIndex < exerciseTypes.length - 1) {
          exerciseTypes[currentIndex + 1].isLocked = false;
        }
      });
    }
  }
}

class ExerciseType {
  final String name;
  bool isLocked;
  final String imagePath;

  ExerciseType({required this.name, required this.isLocked, required this.imagePath});
}

class WorkoutDetailScreen extends StatefulWidget {
  final String exerciseTypeName;
  final List<Workout> workouts;

  const WorkoutDetailScreen({
    super.key,
    required this.exerciseTypeName,
    required this.workouts,
  });

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutDetailScreenState createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  late List<Workout> workouts;
  final Map<String, VideoPlayerController> _videoControllers = {};
  final Map<String, bool> _isVideoInitialized = {};

  @override
  void initState() {
    super.initState();
    workouts = widget.workouts;

    for (var workout in workouts) {
      if (workout.videoPath != null) {
        _videoControllers[workout.name] = VideoPlayerController.asset('assets/video/${workout.videoPath!}')
          ..initialize().then((_) {
            setState(() {
              _isVideoInitialized[workout.name] = true;
            });
          }).catchError((error) {
          });
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.exerciseTypeName} Workouts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            ...workouts.map((workout) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (workout.videoPath != null && _isVideoInitialized[workout.name] == true)
                      Expanded(
                        flex: 3, // Adjusts the width of the video container
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                                  color: Colors.black,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                                  child: VideoPlayer(_videoControllers[workout.name]!),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${workout.name} Video',
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    VideoProgressIndicator(_videoControllers[workout.name]!, allowScrubbing: true),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _videoControllers[workout.name]!.value.isPlaying
                                                ? _videoControllers[workout.name]!.pause()
                                                : _videoControllers[workout.name]!.play();
                                          });
                                        },
                                        child: Icon(
                                          _videoControllers[workout.name]!.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 2, // Adjusts the width of the image and text container
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                                color: Colors.black,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                                child: Image.asset(
                                  'assets/${workout.picture}',
                                  fit: BoxFit.contain, // Adjusted to fit the entire image
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    workout.name,
                                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text('${workout.setsReps}\n${workout.description}'),
                                  Checkbox(
                                    value: workout.completed,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        workout.completed = value ?? false;
                                        _checkCompletionStatus();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _checkCompletionStatus() {
    final allCompleted = workouts.every((workout) => workout.completed);

    if (allCompleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Congratulations! ${widget.exerciseTypeName} is completed.')),
      );

      Navigator.pop(context, true);
    }
  }
}
