import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/features/view_books/presentation/common/book_thumbnail.dart'
    show BookThumbNail;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksWidget extends StatelessWidget {
  const SimilarBooksWidget({super.key, required this.books});
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: BookThumbNail(
              height: 112.h,
              width: 70.w,
              borderRadius: 8.r,
              imageURL: books[index].imageLinks.smallThumbNail,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteConstants.bookDetailsRoute,
                  arguments: books[index].id,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
