import 'package:codefactory_youtube_flutter_tutorial/Layouts/index.dart';
import 'package:codefactory_youtube_flutter_tutorial/Models/index.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/CustomKeyboard/CustomKeyboard.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/CustomPaintHermesAppleWatch/CustomPaintHermesAppleWatch.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/CustomScrollView/CustomScrollViewScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/GetxNavigationScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxStateManagement/GetxStateManagement.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderInfiniteScroll/ProviderInfiniteScrollScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/Retrofit/Screens/RetrofitScreen.dart';
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
        ListViewItem(
          name: 'GetX Navigation',
          page: GetxNavigationScreen(),
        ),
        ListViewItem(
          name: 'Custom ScrollView',
          page: CustomScrollViewScreen(),
        ),
        ListViewItem(
          name: 'GetX State Management',
          page: GetxStateManagementScreen(),
        ),
        ListViewItem(
          name: 'Retrofit Intro',
          page: RetrofitScreen(),
        ),
        ListViewItem(
          name: 'Custom Keyboard',
          page: CustomKeyboard(),
        ),
        ListViewItem(
          name: 'Custom Paint',
          page: CustomPaintHermesAppleWatch(),
        ),
      ],
    );
  }
}
