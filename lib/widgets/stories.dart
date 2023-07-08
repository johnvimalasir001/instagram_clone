import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class CustomStories extends StatelessWidget {
  final List<User> onlineUsers;

  const CustomStories({
    super.key,
    required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 110,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20,
        ),
        itemCount: 1 + onlineUsers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: CustomAddStory(),
            );
          }
          final User user = onlineUsers[index - 1];
          return CustomAvatar(imageUrl: user.imageUrl);
        },
      ),
    );
  }
}
