import 'package:flutter/material.dart';

class DefaultAppbarLayout extends StatefulWidget {
  final String title;
  final Widget child;

  DefaultAppbarLayout({
    @required Widget child,
    String title,
  })  : this.title = title ?? '코드팩토리',
        this.child = child;

  @override
  _DefaultAppbarLayoutState createState() => _DefaultAppbarLayoutState();
}

class _DefaultAppbarLayoutState extends State<DefaultAppbarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: widget.child,
    );
  }
}
