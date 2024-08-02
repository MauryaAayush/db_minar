import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Display'),
      ),
      body: Obx(() {
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
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(
                    getImageForCategory(quote.category),
                    fit: BoxFit.cover,
                  ),
                  // Quote Text
                  Container(
                    color: Colors.black54, // Add a slight background for readability
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quote.quote,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            '- ${quote.author}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            quote.category,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      }),
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
