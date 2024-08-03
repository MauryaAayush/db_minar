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
          ThemeTile(
            imagePath: 'assets/theme/1.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/1.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/2.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/2.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/3.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/3.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/4.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/4.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/5.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/5.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/6.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/6.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/7.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/7.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/8.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/8.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/9.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/9.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/10.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/10.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/11.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/11.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/12.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/12.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/13.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/13.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/14.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/14.jpeg');
              Get.back();
            },
          ),
          ThemeTile(
            imagePath: 'assets/theme/15.jpeg',
            onTap: () {
              dataController.setBackgroundImage('assets/theme/15.jpeg');
              Get.back();
            },
          ),
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
          borderRadius: BorderRadius.circular(12.0),
          // Adjust the radius as needed
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
