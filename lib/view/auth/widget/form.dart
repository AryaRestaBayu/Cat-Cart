import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/widget/custom_button.dart';
import 'package:submission_beginner/view/auth/widget/custom_rich_text.dart';
import 'package:submission_beginner/view/auth/widget/custom_text_field.dart';

class FormAuth extends StatelessWidget {
  const FormAuth({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.isLogin,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Center(
          child: SizedBox(
            // color: Colors.red,
            width: 400,
            // height: 300,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    isLogin ? 'Masuk ke CAT' : 'Daftar ke CAT',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: _emailController,
                      hint: 'Email',
                      isPassword: false,
                      icon: Icons.email_outlined),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: _passwordController,
                      hint: 'Kata sandi',
                      isPassword: true,
                      icon: Icons.lock_outline),
                  const SizedBox(height: 25),
                  CustomButton(
                      text: isLogin ? 'Masuk' : 'Daftar',
                      size: const Size(350, 60),
                      email: _emailController,
                      password: _passwordController),
                  const SizedBox(height: 25),
                  CustomRichText(
                      text:
                          isLogin ? 'Belum punya akun? ' : 'Sudah punya akun? ',
                      textButton: isLogin ? 'Daftar' : 'Masuk',
                      fontSize: 16),
                  const SizedBox(height: 15),
                  const Text(
                    'Atau',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  const CustomRichText(
                      text: 'Lanjutkan sebagai ',
                      textButton: 'Tamu',
                      fontSize: 16)
                ],
              ),
            ),
          ),
        ));
  }
}
