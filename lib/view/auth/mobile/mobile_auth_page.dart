import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/widget/custom_button.dart';
import 'package:submission_beginner/view/auth/widget/custom_rich_text.dart';
import 'package:submission_beginner/view/auth/widget/custom_text_field.dart';

class MobileAuthPage extends StatefulWidget {
  const MobileAuthPage({required this.isLogin, super.key});

  final bool isLogin;

  @override
  State<MobileAuthPage> createState() => _MobileAuthPageState();
}

class _MobileAuthPageState extends State<MobileAuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: 250,
          child: Column(
            children: [
              //logo
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: 220,
                height: 130,
                // color: Colors.red,
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              const SizedBox(height: 40),
              //email
              CustomTextField(
                controller: _emailController,
                hint: 'Email',
                isPassword: false,
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              //kata sandi
              CustomTextField(
                controller: _passwordController,
                hint: 'Kata sandi',
                isPassword: true,
                icon: Icons.lock_outline,
              ),
              const SizedBox(height: 30),
              //masuk
              CustomButton(
                text: widget.isLogin ? 'Masuk' : 'Daftar',
                size: const Size(200, 55),
                email: _emailController,
                password: _passwordController,
              ),
              const SizedBox(height: 30),
              CustomRichText(
                text: widget.isLogin
                    ? 'Belum punya akun? '
                    : 'Sudah punya akun? ',
                textButton: widget.isLogin ? 'Daftar' : 'Masuk',
                fontSize: 15,
              ),
              const SizedBox(height: 10),
              const Text(
                'Atau',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(height: 10),

              const CustomRichText(
                text: 'Lanjutkan sebagai ',
                textButton: 'Tamu',
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
