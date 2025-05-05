import 'package:bookly_app/features/view_books/data/api/books_api.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'package:bookly_app/features/view_books/presentation/home/cubits/featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  final BooksApi booksApi;
  FeaturedCubit(this.booksApi) : super(FeaturedInitial());

  List<BookModel> featuredBooks = [];
  List<BookModel> bestSellerBooks = [];
  int bestSellerPageNumber = 1;

  Future<void> loadFeatured() async {
    emit(LoadingFeatured());

    final newBooks = await booksApi.getBooks(0);
    featuredBooks.addAll(newBooks);

    print(newBooks.length);
    print(featuredBooks.length);

    emit(LoadedFeatured(featuredBooks));
  }
}
