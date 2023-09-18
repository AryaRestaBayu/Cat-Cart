import 'package:flutter/material.dart';
import 'package:submission_beginner/utils/toast.dart';
import 'package:submission_beginner/view/auth/login_page.dart';
import 'package:submission_beginner/view/auth/register_page.dart';
import 'package:submission_beginner/view/home/home_page.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.text,
    required this.textButton,
    required this.fontSize,
  });

  final String text;
  final String textButton;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey[600], fontSize: fontSize),
        ),
        InkWell(
          onTap: () {
            if (textButton == 'Daftar') {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                  (route) => false);
            }
            if (textButton == 'Masuk') {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false);
            }
            if (textButton == 'Tamu') {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
              Utils.toast('Selamat datang', context);
            }
          },
          child: Text(
            textButton,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: fontSize),
          ),
        )
      ],
    );
  }
}
