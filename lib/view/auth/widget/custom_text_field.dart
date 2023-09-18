import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.icon,
  });

  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final IconData icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.black,
        obscureText: widget.isPassword ? visible : false,
        controller: widget.controller,
        decoration: InputDecoration(
          focusColor: Colors.black,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black87,
          ),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  child: visible
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black87,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Colors.black87,
                        ))
              : null,
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ));
  }
}
