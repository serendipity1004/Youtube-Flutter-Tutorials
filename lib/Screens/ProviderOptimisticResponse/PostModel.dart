import 'package:flutter/material.dart';

class PostModel {
  final int id;
  final String title;
  final String content;

  //좋아요
  int likes;

  PostModel.fromJson({
    @required Map<dynamic, dynamic> json,
  })
      : this.id = json['id'],
        this.title = json['title'],
        this.content = json['content'],
        this.likes = json['likes'];

  incrementLike() {
    this.likes = this.likes + 1;
  }

  // class 인스턴스를 map 으로 변경
  toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'content': this.content,
      'likes': this.likes,
    };
  }

  copyWith(){
    return PostModel.fromJson(
      json: this.toMap(),
    );
  }
}
