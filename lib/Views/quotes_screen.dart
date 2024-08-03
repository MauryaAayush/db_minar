import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';


class QuotesScreen extends StatelessWidget {
  final String category;
  final DataController dataController = Get.put(DataController());

  QuotesScreen({required this.category}) {
    // Fetch data for the selected category
    dataController.fetchDataByCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Quotes'),
      ),
      body: Obx(() {
        if (dataController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (dataController.quotes.isEmpty) {
          return Center(child: Text('No quotes found.'));
        }

        return ListView.builder(
          itemCount: dataController.quotes.length,
          itemBuilder: (context, index) {
            final quote = dataController.quotes[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  quote.quote,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
