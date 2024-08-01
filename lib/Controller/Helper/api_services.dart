import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../Model/quotes_model.dart';


class ApiServices {
  static final ApiServices apiServices = ApiServices._singleton();
  ApiServices._singleton();

  Future<List<Quote>?> fetchData() async {
    String apiData = "https://sheetdb.io/api/v1/wwuy3c8hslitp";
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      print('API called successfully');
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Quote.fromJson(json)).toList();
    }
    return null;
  }
}
