import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';

class ThemeScreen extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

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
      child: Card(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
