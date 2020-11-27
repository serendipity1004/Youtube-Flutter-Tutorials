import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenFour extends StatefulWidget {
  @override
  _ScreenFourState createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Get.arguments,
            ),
          ],
        ),
      ),
    );
  }
}
