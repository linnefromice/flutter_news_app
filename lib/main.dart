import 'package:flutter/material.dart';
import 'package:flutter_news_app/blocs/NewsBloc.dart';
import 'package:flutter_news_app/screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Provider<NewsBloc>(
        create: (context) => NewsBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: HomePage(),
      ),
    );
  }
}

