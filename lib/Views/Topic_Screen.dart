import 'package:db_minar/Views/bookmark_screen.dart';
import 'package:db_minar/Views/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/quotes_model.dart';

class TopicScreen extends StatelessWidget {
  TopicScreen({super.key});

  final List<Topic> topics = [
    Topic(
        heading: 'Motivation',
        category: 'Motivation',
        image: 'assets/self_discipline.jpeg'),
    Topic(
        heading: 'Motivation',
        category: 'Love',
        image: 'assets/happiness.jpeg'),
    Topic(
        heading: 'Motivation',
        category: 'Positive',
        image: 'assets/positivity.jpeg'),
    Topic(
        heading: 'Inspiration',
        category: 'Success',
        image: 'assets/success.jpeg'),
    Topic(
        heading: 'Inspiration',
        category: 'Happy',
        image: 'assets/fitness.jpeg'),
    Topic(
        heading: 'Inspiration',
        category: 'Kindness',
        image: 'assets/freedom.jpeg'),
    Topic(
        heading: 'Inspiration',
        category: 'Loyalty',
        image: 'assets/creativity.jpeg'),
    Topic(
        heading: 'Hard Times',
        category: 'Sad',
        image: 'assets/sadness.jpeg'),
    Topic(
        heading: 'Hard Times',
        category: 'Ego',
        image: 'assets/depression.jpeg'),
    Topic(
        heading: 'Hard Times',
        category: 'Gratitude',
        image: 'assets/broken.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back arrow icon and title
                  Stack(
                    children: [
                      Positioned(
                        top: 35,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            // Handle back button press
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            'Topics',
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
                  Text(
                    'Liked Quotes',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('assets/liked.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => BookmarksScreen());
                        },
                        child: Container(
                          height: 130,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Liked',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var name in topics.map((t) => t.heading).toSet())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 7,
                          children: topics
                              .where((e) => e.heading == name)
                              .map((topic) => GestureDetector(
                            onTap: () {
                              Get.to(() =>
                                  QuotesScreen(category: topic.category));
                            },
                            child: TopicCard(topic: topic),
                          ))
                              .toList(),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final Topic topic;

  const TopicCard({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(topic.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.3),
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(8),
          child: Text(
            topic.category,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
