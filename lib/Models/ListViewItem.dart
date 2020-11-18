import 'package:flutter/material.dart';
import 'index.dart';

class ListViewItem extends BaseModel {
  final String name;
  final Widget page;

  ListViewItem({
    @required String name,
    @required Widget page,
  })  : this.name = name,
        this.page = page;
}
