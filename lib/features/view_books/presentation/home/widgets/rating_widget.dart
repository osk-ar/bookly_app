import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.ratingAverage,
    required this.ratingsCount,
  });
  final double ratingAverage;
  final int ratingsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.w,
      children: [
        Icon(Icons.star_rounded, color: Color(0xFFFFDD4F)),
        Text(
          ratingAverage.toString(),
          style: getMediumStyle(fontSize: 16.sp, color: AppColors.foreground),
        ),
        Text(
          "($ratingsCount)",
          style: getRegularStyle(fontSize: 14.sp, color: AppColors.foreground),
        ),
      ],
    );
  }
}
