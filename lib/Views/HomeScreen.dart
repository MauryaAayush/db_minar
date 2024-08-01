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
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(dataController.data.value),
          );
        }
      }),
    );
  }
}
