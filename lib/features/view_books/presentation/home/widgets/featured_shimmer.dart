import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/featured_books_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedShimmer extends StatelessWidget {
  const FeaturedShimmer({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.background,
      highlightColor: AppColors.primary,

      child: CarouselSlider(
        options: CarouselOptions(
          initialPage: 0,
          height: height,
          enlargeFactor: 0.35,
          viewportFraction: 0.48,
          autoPlay: false,
          enlargeCenterPage: true,
          disableCenter: true,
        ),
        items:
            [
              BookModel.empty(),
              BookModel.empty(),
              BookModel.empty(),
              BookModel.empty(),
            ].map((book) {
              return FeaturedBooksItem(
                imgURL: book.imageLinks.thumbNail,
                onTap: () {},
              );
            }).toList(),
      ),
    );
  }
}
