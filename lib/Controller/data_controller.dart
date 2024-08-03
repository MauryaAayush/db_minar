import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/quotes_model.dart';
import 'Helper/api_services.dart';
import 'Helper/database_helper.dart';

class DataController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = false.obs;
  var backgroundImage = 'assets/default.jpeg'.obs;
  var likedQuotes = <Quote>[].obs;

  final DatabaseHelper _databaseHelper = DatabaseHelper();

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
        result.shuffle();
        quotes(result);
      } else {
        print('Here is a problem');
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchDataByCategory(String category) async {
    isLoading(true);
    try {
      List<Quote>? result = await ApiServices.apiServices.fetchData(category: category);
      if (result != null) {
        result.shuffle();
        quotes(result);
      } else {
        print('Here is a problem');
      }
    } finally {
      isLoading(false);
    }
  }

  void setBackgroundImage(String imagePath) {
    backgroundImage.value = imagePath;
  }

  void toggleLike(Quote quote, int index) async {
    if (likedQuotes.any((liked) => liked.quote == quote.quote)) {
      likedQuotes.removeWhere((liked) => liked.quote == quote.quote);
      await _databaseHelper.deleteLikedQuote(quote.quote);
    } else {
      likedQuotes.add(quote);
      await _databaseHelper.insertLikedQuote(quote);
    }

    if (quotes[index].isLiked == "1") {
      quotes[index].isLiked = "0";
    } else {
      quotes[index].isLiked = "1";
    }
    update();
    quotes.refresh();
    print(quotes[index].isLiked);
  }

  void loadLikedQuotes() async {
    List<Quote> likedQuotesFromDb = await _databaseHelper.getLikedQuotes();
    likedQuotes.value = likedQuotesFromDb;
  }
}
