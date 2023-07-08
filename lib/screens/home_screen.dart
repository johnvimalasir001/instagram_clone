import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String logo =
    'https://logos-download.com/wp-content/uploads/2016/03/Instagram_Logo_2016.png';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            floating: true,
            elevation: 10,
            expandedHeight: 50,
            title: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CachedNetworkImage(
                  imageUrl: logo,
                ),
              ),
            ),
            leadingWidth: MediaQuery.of(context).size.width / 3,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.heartOutline,
                  size: 25,
                ),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.facebookMessenger,
                  size: 25,
                ),
                color: Colors.black,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomStories(onlineUsers: onlineUsers),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => PostContainer(
                post: posts[index],
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 0,
              childAspectRatio: 0.6,
              crossAxisSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
