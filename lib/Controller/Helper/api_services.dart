import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiServices{
  static final ApiServices apiServices = ApiServices._singletone();
  ApiServices._singletone();

  Future<String?> fetchData() async {
    String apiData =  "https://sheetdb.io/api/v1/wwuy3c8hslitp";
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if(response.statusCode == 200){
      print('Api Called successfully');
      return response.body;
    }
    return null;
  }

}