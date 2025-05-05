import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/book_details_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/widgets/book_details_shimmer.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/widgets/book_details_widget.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/widgets/similar_books_shimmer.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/widgets/similar_books_widget.dart';
import 'package:bookly_app/features/view_books/presentation/common/default_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key, required this.bookID});
  final String bookID;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  late final BookDetailsCubit bookDetailsCubit;
  late final SimilarBooksCubit similarBooksCubit;

  @override
  void initState() {
    bookDetailsCubit = context.read<BookDetailsCubit>();
    bookDetailsCubit.loadDetails(widget.bookID);

    similarBooksCubit = context.read<SimilarBooksCubit>();
    similarBooksCubit.loadSimilars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.foreground,
        actions: [
          DefaultIconButton(
            onPressed: () {},
            icon: Icons.shopping_cart_outlined,
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          BlocBuilder<BookDetailsCubit, BookDetailsState>(
            builder: (context, state) {
              switch (state) {
                case BookDetailsLoading():
                  return BookDetailsShimmer();
                case BookDetailsLoaded():
                  return BookDetailsWidget(bookModel: state.bookDetails);

                default:
                  return BookDetailsShimmer();
              }
            },
          ),
          SizedBox(height: 56.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "You may also like",
                style: getBoldStyle(
                  fontSize: 16.sp,
                  color: AppColors.foreground,
                ),
              ),
            ),
          ),
          BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              switch (state) {
                case SimilarBooksLoading():
                  return SimilarBooksShimmer();
                case SimilarBooksLoaded():
                  return SimilarBooksWidget(books: state.books);

                default:
                  return SimilarBooksShimmer();
              }
            },
          ),
        ],
      ),
    );
  }
}
