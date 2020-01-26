import 'dart:async';

import 'package:flutter_news_app/models/NewsHeadLine.dart';
import 'package:flutter_news_app/services/NewsService.dart';

class NewsBloc {
  int _countApi;

  final _searchController = StreamController<void>();
  Sink<void> get search => _searchController.sink;

  final _feedNewsListController = StreamController<List<NewsHeadLine>>();
  Stream<List<NewsHeadLine>> get feedNewsList => _feedNewsListController.stream;

  NewsBloc() {
    // search
    _countApi = 0;

    _searchController.stream.listen((_) {
      _feedNewsList();
      _countApi++;
    });
  }

  void _feedNewsList() async {
    final List<NewsHeadLine> newsList = await NewsService.get();
    _searchController.sink.add(newsList);
    print('feedNewsList: ${_countApi}');
  }

  void dispose() {
    _searchController.close();
    _feedNewsListController.close();
  }
}