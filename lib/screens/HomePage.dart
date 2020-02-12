import 'package:flutter/material.dart';
import 'package:flutter_news_app/blocs/NewsBloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
 /*
  void search() {
    NewsService.get();
  }
 */

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter News App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'ZERO',
              style: Theme.of(context).textTheme.display1,
            ),
            StreamBuilder(
              initialData: [],
              stream: bloc.feedNewsList,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Text('NewsList is NULL');
                }
                final List list = snapshot.data;
                if (list.length == 0) {
                  return Text('NewsList is NODATA.');
                } else {
                  return Column(
                    children: <Widget>[
                      Divider(),
                      Text('No.1'),
                      Text("TITLE: ${list[0].title}"),
                      Text("CONTENT: ${list[0].content}"),
                      Text("URL: ${list[0].url}"),
                      Divider(),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.search.add(null);
          print('PRESS FloatingActionButton');
        },
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }
}
