import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/quotes_model.dart';
import 'Helper/api_services.dart';

class DataController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = false.obs;
  var backgroundImage = 'assets/default.jpeg'.obs;
  var likedQuotes = <Quote>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    loadLikedQuotes();
  }

  void fetchData() async {
    isLoading(true);
    try {
      List<Quote>? result = await ApiServices.apiServices.fetchData();
      if (result != null) {
        quotes(result);
      } else {
        // Handle null result
      }
    } finally {
      isLoading(false);
    }
  }

  void setBackgroundImage(String imagePath) {
    backgroundImage.value = imagePath;
  }

  void toggleLike(Quote quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (likedQuotes.contains(quote)) {
      likedQuotes.remove(quote);
    } else {
      likedQuotes.add(quote);
    }
    await prefs.setStringList('likedQuotes', likedQuotes.map((q) => json.encode(q.toJson())).toList());
  }

  void loadLikedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? likedQuotesData = prefs.getStringList('likedQuotes');
    if (likedQuotesData != null) {
      likedQuotes.value = likedQuotesData.map((data) => Quote.fromJson(json.decode(data))).toList();
    }
  }
}
