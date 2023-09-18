import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/fullscreen/fullscreen_auth_page.dart';
import 'package:submission_beginner/view/auth/mobile/mobile_auth_page.dart';
import 'package:submission_beginner/view/auth/web/web_auth_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraint) {
        if (constraint.maxWidth < 700) {
          return const MobileAuthPage(
            isLogin: false,
          );
        } else if (constraint.maxWidth < 1200) {
          return const WebAuthPage(
            isLogin: false,
          );
        } else {
          return const FullScreenAuthPage(
            isLogin: false,
          );
        }
      }),
    );
  }
}
