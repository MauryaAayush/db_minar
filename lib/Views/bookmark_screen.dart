import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart'; // Add this import for animations
import '../Controller/data_controller.dart';
import '../Model/quotes_model.dart';

class BookmarksScreen extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();

   BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Liked Quotes'),
      ),
      body: Obx(() {
        if (dataController.likedQuotes.isEmpty) {
          return Center(
            child: Text(
              'No liked quotes',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          var quotesByCategory = dataController.likedQuotesByCategory;
          return ListView.builder(
            itemCount: quotesByCategory.keys.length,
            itemBuilder: (context, index) {
              var category = quotesByCategory.keys.elementAt(index);
              var quotes = quotesByCategory[category]!;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 4, // Add shadow here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: OpenContainer(
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => QuotesDetailScreen(category: category, quotes: quotes),
                    closedElevation: 0,
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    closedColor: Theme.of(context).cardColor,
                    closedBuilder: (context, openContainer) => ListTile(
                      title: Text(
                        category,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: openContainer,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class QuotesDetailScreen extends StatelessWidget {
  final String category;
  final List<Quote> quotes;

  const QuotesDetailScreen({super.key, required this.category, required this.quotes});

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find<DataController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          var quote = quotes[index];
          var quoteIndex = dataController.likedQuotes.indexOf(quote);
          return Card(
            elevation: 2, // Add shadow here
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                quote.quote,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text('- ${quote.author}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  dataController.toggleLike(quote, quoteIndex);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
