

class Quote {
  final String category;
  final String quote;
  final String author;
   String isLiked;

  Quote({
    required this.category,
    required this.quote,
    required this.author,
    required this.isLiked,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      category: json['category'],
      quote: json['quote'],
      author: json['author'],
      isLiked: json['isLiked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'quote': quote,
      'author': author,
      'isLiked': isLiked,
    };
  }
}
