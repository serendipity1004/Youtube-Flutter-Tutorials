import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderOptimisticResponse/PostModel.dart';
import 'package:codefactory_youtube_flutter_tutorial/Screens/ProviderOptimisticResponse/PostProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final int postId;

  PostCard({
    @required int postId,
  }) : this.postId = postId;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<PostProvider>(context).posts[widget.postId];

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  post.content,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Provider.of<PostProvider>(
                      context,
                      listen: false,
                    ).incrementLike(
                      id: post.id,
                    );
                  },
                  child: Text('좋아요 ${post.likes}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
