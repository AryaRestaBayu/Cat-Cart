import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required this.product,
    required this.width,
    required this.viewportFraction,
  });

  final Product product;
  final double? width;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 250,
      // padding: EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          // aspectRatio: 2.0,
          viewportFraction: viewportFraction,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
        ),
        items: product.listImage.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg', image: url);
            },
          );
        }).toList(),
      ),
    );
  }
}
