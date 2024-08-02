import 'package:flutter/material.dart';


class TopicScreen extends StatelessWidget {
  final List<Topic> topics = [
    Topic(category: 'Motivation', name: 'Self Discipline', image: 'assets/self_discipline.jpeg'),
    Topic(category: 'Motivation', name: 'Happiness', image: 'assets/happiness.jpeg'),
    Topic(category: 'Motivation', name: 'Positivity', image: 'assets/positivity.jpeg'),
    Topic(category: 'Motivation', name: 'Success', image: 'assets/success.jpeg'),
    Topic(category: 'Inspiration', name: 'Fitness', image: 'assets/fitness.jpeg'),
    Topic(category: 'Inspiration', name: 'Freedom', image: 'assets/freedom.jpeg'),
    Topic(category: 'Inspiration', name: 'Creativity', image: 'assets/creativity.jpeg'),
    Topic(category: 'Hard Times', name: 'Sadness', image: 'assets/sadness.jpeg'),
    Topic(category: 'Hard Times', name: 'Depression', image: 'assets/depression.jpeg'),
    Topic(category: 'Hard Times', name: 'Broken', image: 'assets/broken.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              for (var category in topics.map((t) => t.category).toSet())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      category,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: topics
                          .where((t) => t.category == category)
                          .map((topic) => TopicCard(topic: topic))
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

class Topic {
  final String category;
  final String name;
  final String image;


  Topic({required this.category, required this.name, required this.image});
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
            topic.name,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

      ],
    );
  }
}
