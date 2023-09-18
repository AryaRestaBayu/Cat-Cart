import 'package:flutter/material.dart';
import 'package:submission_beginner/view/home/fullscreen/fullscreen_home_page.dart';
import 'package:submission_beginner/view/home/mobile/mobile_home_page.dart';
import 'package:submission_beginner/view/home/web/web_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraint) {
        if (constraint.maxWidth < 700) {
          return const MobileHomePage();
        } else if (constraint.maxWidth < 1100) {
          return const WebHomePage();
        } else {
          return const FullScreenHomePage();
        }
      }),
    );
  }
}
