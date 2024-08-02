import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';

class BookmarksScreen extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Quotes'),
      ),
      body: Obx(() {
        if (dataController.likedQuotes.isEmpty) {
          return Center(child: Text('No liked quotes'));
        } else {
          return ListView.builder(
            itemCount: dataController.likedQuotes.length,
            itemBuilder: (context, index) {
              final quote = dataController.likedQuotes[index];
              return ListTile(
                title: Text(quote.quote),
                subtitle: Text('- ${quote.author}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dataController.toggleLike(quote,index);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
