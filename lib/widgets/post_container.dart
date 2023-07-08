import 'package:cached_network_image/cached_network_image.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool showFullCaption = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post: widget.post),
                const SizedBox(height: 4),
              ],
            ),
          ),
          // ignore: unnecessary_null_comparison
          if (widget.post.imageUrl != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(imageUrl: widget.post.imageUrl),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PostStats(
              post: widget.post,
              showFullCaption: showFullCaption,
              onCaptionPressed: () {
                setState(() {
                  showFullCaption = !showFullCaption;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
