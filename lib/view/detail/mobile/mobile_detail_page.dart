import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/utils/formater.dart';
import 'package:submission_beginner/view/detail/widget/cart_button.dart';
import 'package:submission_beginner/view/detail/widget/custom_carousel.dart';

class MobileDetailPage extends StatelessWidget {
  const MobileDetailPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomCarousel(
                  product: product, width: null, viewportFraction: 0.8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'RP ${Formater.format(product.price)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CartButton(product: product),
    );
  }
}
