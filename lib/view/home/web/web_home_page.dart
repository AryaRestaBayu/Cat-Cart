import 'package:flutter/material.dart';
import 'package:submission_beginner/view/home/widget/list_item.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListItem(
      crossAxisCount: 3,
      widthItem: 600,
    );
  }
}
