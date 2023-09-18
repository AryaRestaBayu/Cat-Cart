import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/view/detail/fullscreen/fullscreen_detail_page.dart';
import 'package:submission_beginner/view/detail/mobile/mobile_detail_page.dart';
import 'package:submission_beginner/view/detail/web/web_detail_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return MobileDetailPage(product: product);
        } else if (constraint.maxWidth < 900) {
          return WebDetailPage(product: product);
        }
        return FullScreenDetailPage(product: product);
      }),
    );
  }
}
