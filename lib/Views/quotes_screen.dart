import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';
import '../Model/quotes_model.dart';

class QuotesScreen extends StatefulWidget {
  final String category;

  QuotesScreen({Key? key, required this.category}) : super(key: key);

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final DataController dataController = Get.find<DataController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataController.fetchDataByCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dataController.backgroundImage.value),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 35,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            'Quotes',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Obx(() {
                    if (dataController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (dataController.quotes.isEmpty) {
                      return Center(
                        child: Text(
                          'No quotes found for this category',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: dataController.quotes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var quote = dataController.quotes[index];
                          return Card(
                            elevation: 2,
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
                                icon: Icon(
                                  Icons.favorite,
                                  color: dataController.likedQuotes.contains(quote)
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  dataController.toggleLike(quote, index);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
