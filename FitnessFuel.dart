// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FoodItem {
  final String imagePath;
  final String title;
  final String description;

  FoodItem({required this.imagePath, required this.title, required this.description});
}

// ignore: use_key_in_widget_constructors
class Fitnessfuel extends StatelessWidget {
  final List<FoodItem> healthyFoods = [
    FoodItem(
      imagePath: 'assets/image_food/berries.jpg',
      title: "Berries",
      description: "High in antioxidants and vitamins, berries help in reducing inflammation and muscle soreness."
    ),
    FoodItem(
      imagePath: 'assets/image_food/chicken.webp',
      title: "Chicken",
      description: "Lean protein source that aids in muscle repair and growth."
    ),
    FoodItem(
      imagePath: 'assets/image_food/eggveggie.jpg',
      title: "Egg Veggie",
      description: "Packed with protein and vitamins, this dish helps in muscle building and repair."
    ),
    FoodItem(
      imagePath: 'assets/image_food/grilled.webp',
      title: "Grilled Dish",
      description: "A balanced dish rich in protein and fiber, perfect for muscle repair and sustained energy."
    ),
    FoodItem(
      imagePath: 'assets/image_food/outmeal.jpg',
      title: "Oatmeal",
      description: "A great source of complex carbs, oatmeal provides sustained energy for long workouts."
    ),
    FoodItem(
      imagePath: 'assets/image_food/potato.jpg',
      title: "Sweet Potatoes",
      description: "Rich in complex carbs and beta-carotene, sweet potatoes provide long-lasting energy."
    ),
    FoodItem(
      imagePath: 'assets/image_food/quinoa.jpg',
      title: "Quinoa",
      description: "A high-protein grain that contains all nine essential amino acids, perfect for muscle recovery."
    ),
    FoodItem(
      imagePath: 'assets/image_food/tuna.jpg',
      title: "Tuna Salad",
      description: "High in protein and omega-3s, this salad is great for muscle recovery and overall health."
    ),
    FoodItem(
      imagePath: 'assets/image_food/eggs.webp',
      title: "Eggs",
      description: "A complete protein source, eggs are essential for muscle building and repair."
    ),
    FoodItem(
      imagePath: 'assets/image_food/yogurt.jpg',
      title: "Greek Yogurt",
      description: "High in protein and probiotics, Greek yogurt helps in muscle recovery and gut health."
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthy Foods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Title and Description
            const Center(
              child: Column(
                children: [
                  Text(
                    'FitSync Healthy Tips',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Pacifico', // Example custom font
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Discover the best foods to fuel your fitness journey. These healthy options provide essential nutrients for muscle recovery and overall well-being.',
                    textAlign: TextAlign.center, // Center the text within the text widget
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ], 
              ),
            ),
            const SizedBox(height: 16.0),
            // List of Healthy Foods
            Expanded(
              child: ListView.builder(
                itemCount: healthyFoods.length,
                itemBuilder: (context, index) {
                  final item = healthyFoods[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.black, // Set the card background color to black
                    child: Row(
                      children: [
                        Image.asset(
                          item.imagePath,
                          width: 200, // Adjust the size of the image
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Set text color to white for contrast
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  item.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white, // Set text color to white for contrast
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
