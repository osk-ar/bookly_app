import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/models/detailed_book_model.dart';
import 'package:bookly_app/features/view_books/presentation/common/book_thumbnail.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({super.key, required this.bookModel});
  final DetailedBookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookThumbNail(
          height: 243.h,
          width: 162.w,
          borderRadius: 24.r,
          imageURL:
              bookModel.imageLinks.thumbNail.isNotEmpty
                  ? bookModel.imageLinks.thumbNail
                  : bookModel.imageLinks.smallThumbNail,
        ),
        SizedBox(height: 24.h),
        Text(
          bookModel.title,
          style: getRegularStyle(fontSize: 30.sp, color: AppColors.foreground),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        Text(
          bookModel.author,
          style: getMediumStyle(fontSize: 18.sp, color: AppColors.foreground),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        RatingWidget(
          ratingAverage: bookModel.averageRating,
          ratingsCount: bookModel.ratingsCount,
        ),
        SizedBox(height: 36.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.foreground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              ),

              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: getBoldStyle(
                      fontSize: 20.sp,
                      color: AppColors.onForeground,
                    ),
                    children: [
                      TextSpan(
                        text:
                            bookModel.saleInfo.salability == Salability.forSale
                                ? bookModel.saleInfo.price.price.toString()
                                : bookModel.saleInfo.salability.name,
                      ),
                      TextSpan(
                        text:
                            bookModel.saleInfo.salability == Salability.forSale
                                ? " ${bookModel.saleInfo.price.currencyCode}"
                                : "",

                        style: getBoldStyle(
                          fontSize: 15.sp,
                          color: AppColors.onForeground,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150.w,
              height: 48.h,
              child: Material(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                color: AppColors.primary,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Free preview",
                      style: getRegularStyle(
                        fontSize: 16.sp,
                        color: AppColors.foreground,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
