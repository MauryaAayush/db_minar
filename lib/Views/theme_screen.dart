import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';

class ThemeScreen extends StatelessWidget {
  final DataController dataController = Get.put(DataController());
  ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8.0),
        children: [
          ThemeTile(
            imagePath: 'assets/image2.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/image2.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/image9.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/image9.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/life.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/life.jpeg');
              Get.back();
            },
          ),
          // Add more ThemeTiles as needed
        ],
      ),
    );
  }
}

class ThemeTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ThemeTile({required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
