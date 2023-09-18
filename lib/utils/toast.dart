import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Utils {
  static void toast(String text, BuildContext context) {
    showToast(
      text,
      context: context,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
