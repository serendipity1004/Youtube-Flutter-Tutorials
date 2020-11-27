import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenFive extends StatefulWidget {
  @override
  _ScreenFiveState createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Screen Five',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Get.parameters['param'],
            ),
            Text(
              Get.parameters['id'],
            ),
            Text(
              Get.parameters['name'],
            ),
          ],
        ),
      ),
    );
  }
}


