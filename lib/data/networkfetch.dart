import 'dart:convert';

import 'FetchDataException.dart';
import 'homeModel.dart';
import 'package:http/http.dart' as http;

class NetworkFetch implements HomeFetchData{
  String url = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<HomeModel>> fetchHome() async {
    Map<String, dynamic > result = {};
    http.Response response = await http.get(Uri.parse(url));
    final statusCode = response.statusCode;
    var x = json.decode(response.body);
    result['result'] = x;
    final DataHome _dataHotels = new DataHome.fromMap(result);

    if (statusCode != 200 ) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return _dataHotels.result.map((hotels) => HomeModel.fromJson(hotels)).toList();
  }


}