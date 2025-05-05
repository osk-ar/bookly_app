import 'package:bookly_app/features/view_books/presentation/home/widgets/best_seller_item.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({
    super.key,
    required this.books,
    required this.isLoading,
  });
  final List<BookModel> books;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),

      sliver: SliverList.separated(
        itemCount: books.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),

        itemBuilder:
            (context, index) => BestSellerItem(bookModel: books[index]),
      ),
    );
  }
}
