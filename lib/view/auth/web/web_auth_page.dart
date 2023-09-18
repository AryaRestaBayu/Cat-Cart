import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/widget/form.dart';
import 'package:submission_beginner/view/auth/widget/slogan.dart';

class WebAuthPage extends StatefulWidget {
  const WebAuthPage({required this.isLogin, super.key});

  final bool isLogin;

  @override
  State<WebAuthPage> createState() => _WebAuthPageState();
}

class _WebAuthPageState extends State<WebAuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Slogan(),
        FormAuth(
          emailController: _emailController,
          passwordController: _passwordController,
          isLogin: widget.isLogin,
        )
      ],
    );
  }
}
