import 'package:codefactory_youtube_flutter_tutorial/Layouts/index.dart';
import 'package:codefactory_youtube_flutter_tutorial/Models/index.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderInfiniteScroll/ProviderInfiniteScrollScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListViewLayout(
      items: [
        ListViewItem(
          name: 'Row & Column',
          page: RowAndColumnScreen(),
        ),
        ListViewItem(
          name: 'Provider Infinite Scroll',
          page: ProviderInfiniteScrollScreen(),
        ),
        ListViewItem(
          name: 'Provider Optimistic Response',
          page: ProviderOptimisticResponseScreen(),
        ),
      ],
    );
  }
}
