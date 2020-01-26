import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsRepository {

  static Future<Map> get() async {
    http.Response response = await http.get(
      Uri.encodeFull('https://newsapi.org/v2/top-headlines?country=jp&apiKey=ba3ba48bf51446e493e3c4f331edf97b'),
      headers: {
        'Accept': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      if (data['status'] == 'ok') {
        return data;
      }
    }
    print('NewsRepository get()');
  }
}