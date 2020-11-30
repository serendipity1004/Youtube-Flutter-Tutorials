import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxStateManagement/OnUpdateScreen.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/GetxStateManagement/ReactiveScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxStateManagementScreen extends StatefulWidget {
  @override
  _GetxStateManagementScreenState createState() =>
      _GetxStateManagementScreenState();
}

class _GetxStateManagementScreenState extends State<GetxStateManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'GetX State Management',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.to(OnUpdateScreen());
              },
              child: Text('On Update'),
            ),
            RaisedButton(
              onPressed: (){
                Get.to(ReactiveScreen());
              },
              child: Text('Reactive'),
            ),
          ],
        ),
      ),
    );
  }
}
