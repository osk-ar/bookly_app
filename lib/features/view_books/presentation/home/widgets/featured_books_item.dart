import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/features/view_books/presentation/common/book_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedBooksItem extends StatelessWidget {
  const FeaturedBooksItem({
    super.key,
    required this.imgURL,
    required this.onTap,
  });
  final String imgURL;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return imgURL.isNotEmpty
        ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: BookThumbNail(
            height: 10,
            width: 10,
            borderRadius: 16.r,
            imageURL: imgURL,
            onTap: onTap,
          ),
        )
        : _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book, size: 160.r, color: Colors.grey[400]),
            SizedBox(height: 8.h),
            Text(
              'No Cover',
              style: getMediumStyle(fontSize: 14.sp, color: Colors.grey[600]!),
            ),
          ],
        ),
      ),
    );
  }
}
