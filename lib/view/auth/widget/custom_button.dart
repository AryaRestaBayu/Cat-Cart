import 'package:flutter/material.dart';
import 'package:submission_beginner/utils/toast.dart';
import 'package:submission_beginner/view/home/home_page.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.email,
    required this.password,
    required this.size,
  });

  final String text;
  final TextEditingController email;
  final TextEditingController password;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (email.text.isEmpty) {
          return Utils.toast('Email tidak boleh kosong', context);
        }
        if (password.text.isEmpty) {
          return Utils.toast('Password tidak boleh kosong', context);
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false);
        Utils.toast('Selamat datang ${email.text}', context);
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        minimumSize: size,
      ),
      child: Text(text),
    );
  }
}
