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
          var quotesByCategory = dataController.likedQuotesByCategory;
          return ListView.builder(
            itemCount: quotesByCategory.keys.length,
            itemBuilder: (context, index) {
              var category = quotesByCategory.keys.elementAt(index);
              var quotes = quotesByCategory[category]!;
              return ExpansionTile(
                title: Text(category),
                children: quotes.map((quote) {
                  var quoteIndex = dataController.likedQuotes.indexOf(quote);
                  return ListTile(
                    title: Text(quote.quote),
                    subtitle: Text('- ${quote.author}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        dataController.toggleLike(quote, quoteIndex);
                      },
                    ),
                  );
                }).toList(),
              );
            },
          );
        }
      }),
    );
  }
}
