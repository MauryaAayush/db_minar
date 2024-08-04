import 'package:db_minar/Views/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/data_controller.dart';
import '../Model/quotes_model.dart';
import 'Topic_Screen.dart';

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
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataController.quotes.length,
                itemBuilder: (context, index) {
                  var quote = dataController.quotes[index];
                  return Stack(
                    children: [
                      Container(
                        color: Colors.black54, // Add a slight background for readability
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                quote.quote,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                '- ${quote.author}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 40,
                          left : 10,
                          child: IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.arrow_back,color: Colors.white,))),
                      Positioned(
                        top: 50,
                        left: 60,
                        child: Text(
                          quote.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 16.0,
                        child: IconButton(
                          icon: Icon(
                            dataController.quotes[index].isLiked == "1" ? Icons.favorite : Icons.favorite_border,
                            color: dataController.quotes[index].isLiked == "1" ? Colors.red : Colors.white,
                          ),


                          onPressed: () {
                            dataController.toggleLike(quote,index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TransparentButton(
                  text: 'Theme',
                  icon: Icons.palette,
                  onPressed: () {
                    Get.to(() => ThemeScreen());
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TransparentButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const TransparentButton({super.key, required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.2), // Transparent background
      ),
    );
  }
}