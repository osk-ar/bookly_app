import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailsShimmer extends StatelessWidget {
  const BookDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.background,
      highlightColor: AppColors.primary,
      child: Column(
        children: [
          Container(
            width: 162.w,
            height: 243.h,
            decoration: BoxDecoration(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            width: 200.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 120.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),

          SizedBox(height: 8.h),

          Container(
            width: 48.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(height: 36.h),
          Container(
            width: 300.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ],
      ),
    );
  }
}
