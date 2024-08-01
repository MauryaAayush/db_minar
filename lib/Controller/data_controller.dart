import 'package:get/get.dart';
import '../Model/quotes_model.dart';
import 'Helper/api_services.dart';


class DataController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
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
}
