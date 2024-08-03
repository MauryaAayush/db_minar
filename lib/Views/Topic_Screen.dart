
import 'package:db_minar/Views/quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/quotes_model.dart';

class TopicScreen extends StatefulWidget {
  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final List<Topic> topics = [
    Topic(heading: 'Motivation', category: 'Self Discipline', image: 'assets/self_discipline.jpeg'),
    Topic(heading: 'Motivation', category: 'Happiness', image: 'assets/happiness.jpeg'),
    Topic(heading: 'Motivation', category: 'Positivity', image: 'assets/positivity.jpeg'),
    Topic(heading: 'Inspiration', category: 'Success', image: 'assets/success.jpeg'),
    Topic(heading: 'Inspiration', category: 'Fitness', image: 'assets/fitness.jpeg'),
    Topic(heading: 'Inspiration', category: 'Freedom', image: 'assets/freedom.jpeg'),
    Topic(heading: 'Inspiration', category: 'Creativity', image: 'assets/creativity.jpeg'),
    Topic(heading: 'Hard Times', category: 'Sadness', image: 'assets/sadness.jpeg'),
    Topic(heading: 'Hard Times', category: 'Depression', image: 'assets/depression.jpeg'),
    Topic(heading: 'Hard Times', category: 'Broken', image: 'assets/broken.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var name in topics.map((t) => t.heading).toSet())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: topics
                          .where((e) => e.heading == name)
                          .map((topic) => GestureDetector(
                        onTap: () {
                          Get.to(() => QuotesScreen(category: topic.category));
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
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
