import 'package:flutter/material.dart';

class _SliverFixedHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverFixedHeader({
    @required this.maxHeight,
    @required this.minHeight,
    @required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(_SliverFixedHeader oldDelegate,) {
    // TODO: implement shouldRebuild
    return oldDelegate.maxHeight != this.maxHeight ||
        oldDelegate.minHeight != this.minHeight ||
        oldDelegate.child != this.child;
  }

}

class CustomScrollViewScreen extends StatefulWidget {
  @override
  _CustomScrollViewScreenState createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  getColor(index,) {
    final color = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    return color[index % color.length];
  }

  renderSliverAppbar() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: Image.asset(
        'assets/seoul-night-view.jpg',
        fit: BoxFit.cover,
      ),
      title: Text(
        'Seoul',
      ),
    );
  }

  renderSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            color: getColor(
              index,
            ),
          );
        },
        childCount: 32,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
    );
  }

  renderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            color: getColor(
              index,
            ),
            height: 100.0,
          );
        },
        childCount: 8,
      ),
    );
  }

  renderHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeader(
        maxHeight: 200.0,
        minHeight: 75.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          child: Center(
            child: Text(
              '신기하지~',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderHeader(),
          renderSliverGrid(),
          renderHeader(),
          renderSliverList(),
          renderHeader(),
          renderSliverGrid(),
          renderHeader(),
          renderSliverList(),
        ],
      ),
    );
  }
}
