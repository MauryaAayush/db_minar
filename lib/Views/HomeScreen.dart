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
        } else if (dataController.quotes.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: dataController.quotes.length,
            itemBuilder: (context, index) {
              final quote = dataController.quotes[index];
              return ListTile(
                title: Text(quote.quote),
                subtitle: Text('${quote.author} - ${quote.category}'),
              );
            },
          );
        }
      }),
    );
  }
}
