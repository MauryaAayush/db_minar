import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fixed Background Image
          Obx(() {
            if (dataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (dataController.quotes.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              // Assuming the first quote's category determines the background image
              final backgroundImage = getImageForCategory(dataController.quotes[0].category);
              return Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              );
            }
          }),
          // Quotes PageView
          Obx(() {
            if (dataController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (dataController.quotes.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataController.quotes.length,
                itemBuilder: (context, index) {
                  final quote = dataController.quotes[index];
                  return Container(
                    color: Colors.black54, // Add a slight background for readability
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quote.quote,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            '- ${quote.author}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            quote.category,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
          // Transparent Buttons at the Bottom
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransparentButton(
                  text: 'Topic',
                  icon: Icons.topic,
                  onPressed: () {
                    // Handle topic button press
                  },
                ),
                TransparentButton(
                  text: 'Theme',
                  icon: Icons.palette,
                  onPressed: () {
                    // Handle theme button press
                  },
                ),
                TransparentButton(
                  text: 'Setting',
                  icon: Icons.settings,
                  onPressed: () {
                    // Handle setting button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to get the image based on the category
  String getImageForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'inspiration':
        return 'assets/image2.jpeg';
      case 'love':
        return 'assets/image9.jpeg';
      case 'life':
        return 'assets/life.jpeg';
    // Add more categories and images as needed
      default:
        return 'assets/default.jpeg';
    }
  }
}

class TransparentButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const TransparentButton({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.2), // Transparent background
      ),
    );
  }
}
