import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SimilarBooksShimmer extends StatelessWidget {
  const SimilarBooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: AppColors.background,
        highlightColor: AppColors.primary,

        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                width: 70.w,
                height: 112.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.greenAccent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
