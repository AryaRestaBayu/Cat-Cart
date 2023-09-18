import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/fullscreen/fullscreen_auth_page.dart';
import 'package:submission_beginner/view/home/widget/list_item.dart';

class FullScreenHomePage extends StatelessWidget {
  const FullScreenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 1, child: ListPaw()),
        Flexible(
          flex: 7,
          child: ListItem(
            crossAxisCount: 4,
            widthItem: 800,
          ),
        ),
        Flexible(flex: 1, child: ListPaw()),
      ],
    );
  }
}
