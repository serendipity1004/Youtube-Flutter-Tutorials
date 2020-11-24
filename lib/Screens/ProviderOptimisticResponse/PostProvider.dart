import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PostModel.dart';

class PostProvider extends ChangeNotifier {
  LinkedHashMap<int, PostModel> posts = new LinkedHashMap();

  Future<List> _fetchList() async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(
      20,
      (index) => {
        'id': index,
        'title': 'title $index',
        'content': 'content $index',
        'likes': 0,
        'dislikes': 0,
      },
    );
  }

  Future<Map<dynamic, dynamic>> _postIncrementLike({
    @required int id,
    @required PostModel snapshot,
  }) async {
    assert(id != null);

    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();
    snapshot.incrementLike();

    return snapshot.toMap();
  }

  incrementLike({
    @required int id,
  }) async {
    assert(id != null);

    final snapshot = posts[id].copyWith();

    // Cache Update - 1
    this.posts[id].incrementLike();
    notifyListeners();

    // Network 요창 - 2
    final newMap = await _postIncrementLike(
      id: id,
      snapshot: snapshot,
    );

    this.posts.update(
          id,
          (value) => PostModel.fromJson(
            json: newMap,
          ),
        );

    notifyListeners();
  }

  fetchItems() async {
    final newList = await _fetchList();

    final parsedList = newList.map(
      (x) => PostModel.fromJson(
        json: x,
      ),
    );

    this.posts.addEntries(
          parsedList.map(
            (x) => MapEntry(
              x.id,
              x,
            ),
          ),
        );

    notifyListeners();
  }
}
