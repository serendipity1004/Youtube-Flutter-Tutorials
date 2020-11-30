import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxStateManagement/GetxController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnUpdateScreen extends StatefulWidget {
  @override
  _OnUpdateScreenState createState() => _OnUpdateScreenState();
}

class _OnUpdateScreenState extends State<OnUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuilderController());

    return DefaultAppbarLayout(
      title: 'On Update',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'On Update',
            ),
            GetBuilder<BuilderController>(
              builder: (_) {
                return Text('count : ${_.count}');
              },
            ),
            RaisedButton(
              onPressed: (){
                controller.increment();
              },
              child: Text('Count 업!'),
            ),
          ],
        ),
      ),
    );
  }
}
