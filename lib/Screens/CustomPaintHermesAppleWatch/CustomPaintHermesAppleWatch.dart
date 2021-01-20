import 'dart:async';

import 'package:flutter/material.dart';

import 'WatchPainter.dart';

class CustomPaintHermesAppleWatch extends StatefulWidget {
  @override
  _CustomPaintHermesAppleWatchState createState() => _CustomPaintHermesAppleWatchState();
}

class _CustomPaintHermesAppleWatchState extends State<CustomPaintHermesAppleWatch> {
  DateTime now;

  @override
  void initState() {
    super.initState();

    now = DateTime.now();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width /2,
          child: AspectRatio(
            aspectRatio: 2/3,
            child: CustomPaint(
              painter: WatchPainter(
                now,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

