import 'dart:developer' as dev;
import 'dart:math';

import 'package:bookly_app/features/view_books/data/api/books_api.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:bookly_app/features/view_books/presentation/book_details/cubit/similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final BooksApi booksApi;
  SimilarBooksCubit(this.booksApi) : super(SimilarBooksInitial());

  void loadSimilars() async {
    emit(SimilarBooksLoading());

    Random random = Random(DateTime.now().millisecond);
    int startIndex = (random.nextInt(250) + 1);
    dev.log(startIndex.toString());
    final List<BookModel> books = await booksApi.getBooks(startIndex);

    emit(SimilarBooksLoaded(books));
  }
}
