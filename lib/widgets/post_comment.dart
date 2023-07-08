import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';

class PostComment extends StatelessWidget {
  final Post post;
  final User currentUser;

  const PostComment({
    super.key,
    required this.post,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    String commentsCount = post.comments > 1000
        ? ' ${post.comments ~/ 1000}k'
        : post.comments.toString();
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "View all $commentsCount comments",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(width: 5),
              const Text(
                "Add a comment...",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "${post.timeAgo} ago",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}