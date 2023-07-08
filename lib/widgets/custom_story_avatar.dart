import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';

class CustomAvatar extends StatelessWidget {
  final String imageUrl;

  const CustomAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfff7b553),
                  Color(0xffef732b),
                  Color(0xff5f47b9),
                  Color(0xff9437b9),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            currentUser.name,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}