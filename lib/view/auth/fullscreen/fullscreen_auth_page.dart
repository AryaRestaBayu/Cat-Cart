import 'package:flutter/material.dart';
import 'package:submission_beginner/view/auth/widget/form.dart';
import 'package:submission_beginner/view/auth/widget/slogan.dart';

class FullScreenAuthPage extends StatefulWidget {
  const FullScreenAuthPage({required this.isLogin, super.key});

  final bool isLogin;

  @override
  State<FullScreenAuthPage> createState() => _FullScreenAuthPageState();
}

class _FullScreenAuthPageState extends State<FullScreenAuthPage> {
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
        ),
        const ListPaw(),
      ],
    );
  }
}

class ListPaw extends StatelessWidget {
  const ListPaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(left: BorderSide(color: Colors.grey[600]!)),
      ),
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const SizedBox(
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image(image: AssetImage('assets/paw.png')),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image(image: AssetImage('assets/paw.png')),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
