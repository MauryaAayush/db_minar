import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';
import 'bookmark_screen.dart';
import 'theme_screen.dart';

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
              final backgroundImage = dataController.backgroundImage.value;
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
                  final isLiked = dataController.likedQuotes.contains(quote);

                  return Stack(
                    children: [
                      Container(
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
                      ),
                      Positioned(
                        top: 36.0,
                        left: 16.0,
                        child: Text(
                          quote.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 36.0,
                        right: 16.0,
                        child: IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.white,
                          ),
                          onPressed: ()  {

                          },
                        ),
                      ),
                    ],
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
                    Get.to(BookmarksScreen());
                  },
                ),
                TransparentButton(
                  text: 'Theme',
                  icon: Icons.palette,
                  onPressed: () {
                    Get.to(ThemeScreen());
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
}

class TransparentButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const TransparentButton({super.key, required this.text, required this.icon, required this.onPressed});

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
