import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String logo =
    'https://logos-download.com/wp-content/uploads/2016/03/Instagram_Logo_2016.png';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: SizedBox(
            height: 40,
            child: Image.network(
              logo,
              height: 40,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                splashRadius: 10,
                onPressed: () {},
                icon: Icon(
                  MdiIcons.plusBoxOutline,
                  size: 28,
                ),
              ),
              IconButton(
                splashRadius: 10,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
              ),
              IconButton(
                splashRadius: 10,
                onPressed: () {},
                icon: Icon(
                  MdiIcons.facebookMessenger,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
