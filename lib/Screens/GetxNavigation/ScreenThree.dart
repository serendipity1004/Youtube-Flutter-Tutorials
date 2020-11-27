import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenThree extends StatefulWidget {
  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 0,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value;
                    });
                  },
                ),
                Text('0'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 1,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value;
                    });
                  },
                ),
                Text('1'),
              ],
            ),
            Row(
              children: [
                Radio(
                  groupValue: radioVal,
                  value: 2,
                  onChanged: (value) {
                    setState(() {
                      radioVal = value;
                    });
                  },
                ),
                Text('2'),
              ],
            ),
            RaisedButton(
              onPressed: () {
                Get.back(result: radioVal);
              },
              child: Text(
                '뒤로가기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
