import 'package:codefactory_youtube_flutter_tutorial/Screens/Home/HomeScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderInfiniteScroll/AjaxProvider.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderOptimisticResponse/PostProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AjaxProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
