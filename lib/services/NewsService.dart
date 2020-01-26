import 'package:flutter_news_app/models/NewsHeadLine.dart';
import 'package:flutter_news_app/repositories/NewsRepository.dart';

class NewsService {

  static Future<List<NewsHeadLine>> get() async {
    Map data = await NewsRepository.get();
    List rowList = data['articles'];
    List<NewsHeadLine> dtoList = [];
    for (int i=0; i<rowList.length; i++) {
      NewsHeadLine dto = NewsHeadLine.fromJson(rowList[i]);
      dtoList.add(dto);
    }
    // TODO: delete(test code)
    /*
    NewsHeadLine tmp = dtoList[0];
    print("TITLE: " + tmp.title);
    print("CONTENT: " + tmp.content);
    print("URL: " + tmp.url);
    */
    return dtoList;
  }
}