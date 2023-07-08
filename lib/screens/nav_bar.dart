import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedindex = 0;
  List pages = [
    const HomeScreen(),
    const Scaffold(
      backgroundColor: Colors.amber,
    ),
    const Scaffold(
      backgroundColor: Colors.pink,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => selectedindex = index),
          currentIndex: selectedindex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          items: [
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add_box_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                MdiIcons.instagram,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                radius: 20,
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
