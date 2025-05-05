part of 'package:bookly_app/features/view_books/presentation/book_details/cubit/book_details_cubit.dart';

class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsLoaded extends BookDetailsState {
  final DetailedBookModel bookDetails;
  BookDetailsLoaded(this.bookDetails);
}
