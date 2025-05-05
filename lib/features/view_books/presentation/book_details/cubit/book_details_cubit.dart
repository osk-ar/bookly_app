import 'package:bookly_app/core/models/detailed_book_model.dart';
import 'package:bookly_app/features/view_books/data/api/books_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:bookly_app/features/view_books/presentation/book_details/cubit/book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final BooksApi booksApi;

  BookDetailsCubit(this.booksApi) : super(BookDetailsInitial());

  void loadDetails(String id) async {
    emit(BookDetailsLoading());
    final DetailedBookModel bookDetails = await booksApi.getBookDetails(id);
    emit(BookDetailsLoaded(bookDetails));
  }
}
