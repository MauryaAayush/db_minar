class Quote {
  final String category;
  final String quote;
  final String author;

  Quote({required this.category, required this.quote, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      category: json['category'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
