import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/view/detail/widget/custom_carousel.dart';
import 'package:submission_beginner/view/detail/widget/deskripsi.dart';
import 'package:submission_beginner/view/detail/widget/form_checkout.dart';

class FullScreenDetailPage extends StatelessWidget {
  const FullScreenDetailPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .96,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomCarousel(
                  product: product,
                  width: MediaQuery.of(context).size.width,
                  viewportFraction: 0.3,
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Deskripsi(product: product),
                    const SizedBox(
                      width: 20,
                    ),
                    FormCheckout(product: product)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
