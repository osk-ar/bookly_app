part of 'package:bookly_app/features/view_books/presentation/book_details/cubit/similar_books_cubit.dart';

class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksLoaded extends SimilarBooksState {
  final List<BookModel> books;
  SimilarBooksLoaded(this.books);
}
