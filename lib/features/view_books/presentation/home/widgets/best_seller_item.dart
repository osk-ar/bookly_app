import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/features/view_books/presentation/common/book_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteConstants.bookDetailsRoute,
          arguments: bookModel.id,
        );
      },
      child: Row(
        spacing: 24.w,
        children: [
          BookThumbNail(
            width: 86.w,
            height: 130.h,
            borderRadius: 8.r,
            imageURL: bookModel.imageLinks.smallThumbNail,
          ),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: getRegularStyle(
                    fontSize: 20.sp,
                    color: AppColors.foreground,
                  ),
                ),
                Text(
                  bookModel.author,
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),

                Text(
                  bookModel.description,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
