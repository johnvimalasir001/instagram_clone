import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class PostStats extends StatelessWidget {
  final Post post;
  final bool showFullCaption;
  final VoidCallback onCaptionPressed;

  const PostStats({
    super.key,
    required this.post,
    required this.showFullCaption,
    required this.onCaptionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: LikeButton(),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "lib/assets/comment.png",
                height: 22,
              ),
            ),
            _PostButton(
              icon: const Icon(
                Icons.send,
                color: Colors.black,
                size: 28,
              ),
              onTap: () {},
            ),
            const Spacer(),
            const SaveButton(),
          ],
        ),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Liked ',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const TextSpan(
                    text: 'by ',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const TextSpan(
                    text: 'Kenzeroe ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: 'and ',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text: "${post.likes} Others",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: onCaptionPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                post.caption,
                maxLines: showFullCaption ? null : 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              if (!showFullCaption)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Row(
          children: [
            PostComment(
              post: post,
              currentUser: currentUser,
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;

  final Function onTap;

  const _PostButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap(),
        child: SizedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class SaveButton extends StatefulWidget {
  const SaveButton({
    super.key,
  });

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

bool isSaved = false;

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      icon: !isSaved
          ? const Icon(
              Icons.bookmark_outline,
              size: 28,
            )
          : const Icon(
              Icons.bookmark,
              size: 28,
              color: Colors.black,
            ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_outline,
        size: 28,
        color: isLiked ? Colors.red : null,
      ),
    );
  }
}