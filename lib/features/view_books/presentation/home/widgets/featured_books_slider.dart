import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeaturedBooksSlider extends StatelessWidget {
  const FeaturedBooksSlider({
    super.key,
    required this.items,
    required this.height,
  });
  final List<Widget> items;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: 0,
        height: height,
        enlargeFactor: 0.35,
        viewportFraction: 0.48,
        autoPlay: true,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
      items: items,
    );
  }
}
