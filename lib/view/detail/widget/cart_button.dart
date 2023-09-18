import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/view/detail/widget/custom_bottom_sheet.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                product: product,
              );
            });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: const Center(
            child: Icon(
          Icons.shopping_cart_checkout,
          size: 30,
          color: Colors.white,
        )),
      ),
    );
  }
}
