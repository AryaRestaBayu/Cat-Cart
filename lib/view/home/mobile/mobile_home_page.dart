import 'package:flutter/material.dart';
import 'package:submission_beginner/view/home/widget/list_item.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListItem(
      crossAxisCount: 2,
      widthItem: 400,
    );
  }
}
