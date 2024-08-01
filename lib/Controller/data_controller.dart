import 'package:get/get.dart';
import 'Helper/api_services.dart';


class DataController extends GetxController {
  var data = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      String? result = await ApiServices.apiServices.fetchData();
      if (result != null) {
        data(result);
      } else {
        data('Failed to load data');
      }
    } finally {
      isLoading(false);
    }
  }
}
