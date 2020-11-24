import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderOptimisticResponse/PostCard.dart';
import 'package:flutter/material.dart';
import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:provider/provider.dart';
import 'PostProvider.dart';

class ProviderOptimisticResponseScreen extends StatefulWidget {
  @override
  _ProviderOptimisticResponseScreenState createState() =>
      _ProviderOptimisticResponseScreenState();
}

class _ProviderOptimisticResponseScreenState
    extends State<ProviderOptimisticResponseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      Provider.of<PostProvider>(context, listen: false).fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    final posts = provider.posts;

    return DefaultAppbarLayout(
      title: 'Provider Optimistic Response',
      child: ListView.separated(
        itemBuilder: (context, index) {
          return PostCard(
            postId: index,
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey[200],
            height: 16.0,
          );
        },
        itemCount: posts.length,
      ),
    );
  }
}
