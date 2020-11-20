import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AjaxProvider extends ChangeNotifier {
  List<int> cache = [];

  // 로딩
  bool loading = false;
  // 아이템이 더 있는지
  bool hasMore = true;

  _makeRequest({
    @required int nextId,
  }) async {
    assert(nextId != null);

    await Future.delayed(Duration(seconds: 1));

    // Item 은 nextId 가 99 까지만 있음
    if(nextId == 100){
      return [];
    }

    //nextId 다음의 20개의 값을 리스트로 리턴
    return List.generate(20, (index) => nextId + index);
  }

  fetchItems({
    int nextId,
  }) async {
    nextId ??= 0;

    loading = true;

    notifyListeners();

    final items = await _makeRequest(nextId: nextId);

    this.cache = [
      ...this.cache,
      ...items,
    ];

    if(items.length == 0){
      hasMore = false;
    }

    loading = false;

    notifyListeners();
  }
}
