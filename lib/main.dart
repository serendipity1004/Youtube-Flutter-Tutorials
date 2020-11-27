import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/GetxNavigationScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/ScreenFive.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/ScreenFour.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/ScreenThree.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxNavigation/ScreenTwo.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/Home/HomeScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderInfiniteScroll/AjaxProvider.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderOptimisticResponse/PostProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => GetxNavigationScreen(),
        ),
        GetPage(
          name: '/two',
          page: () => ScreenTwo(),
        ),
        GetPage(
          name: '/three',
          page: () => ScreenThree(),
        ),
        GetPage(
          name: '/four',
          page: () => ScreenFour(),
        ),
        GetPage(
          name: '/five/:param',
          page: () => ScreenFive(),
        ),
      ],
    );
  }
}
