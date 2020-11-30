import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuilderController extends GetxController {
  int count = 0;

  increment() {
    count++;
    update();
  }
}

class User {
  int id;
  String name;

  User({
    @required int id,
    @required String name,
  })  : this.id = id,
        this.name = name;
}

class ReactiveController extends GetxController {
  RxInt count1 = 0.obs;
  var count2 = 0.obs;

  var user = new User(
    id: 1,
    name: '코드팩토리',
  ).obs;

  List testList = [1, 2, 3, 4, 5].obs;

  get sum => count1.value + count2.value;

  change({
    @required int id,
    @required String name,
  }) {
    user.update((val) {
      val.name = name;
      val.id = id;
    });
  }

  @override
  void onInit() {
    super.onInit();

    ever(count1, (_) {
      print('EVER : COUNT1 이 변경 될때마다 실행');
    });
    once(count1, (_) {
      print('ONCE : 처음으로 COUNT1 이 변경 되었을때');
    });
    debounce(
      count1,
      (_) {
        print('DEBOUNCE : 1초간 디바운스 한 뒤에 실행');
      },
      time: Duration(seconds: 1),
    );
    interval(
      count1,
      (_) {
        print('INTERVAL : 1초간 이터벌이 지나면 실행');
      },
      time: Duration(seconds: 1),
    );
  }
}
