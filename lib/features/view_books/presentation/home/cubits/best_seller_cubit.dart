import 'dart:developer';

import 'package:bookly_app/features/view_books/data/api/books_api.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:bookly_app/features/view_books/presentation/home/cubits/best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  final BooksApi booksApi;
  BestSellerCubit(this.booksApi) : super(BestSellerInitial());

  List<BookModel> bestSellerBooks = [];
  int bestSellerPageNumber = 10;

  Future<void> loadBestSellers() async {
    emit(LoadingBestSeller());

    final newBooks = await booksApi.getBooks(bestSellerPageNumber);
    bestSellerBooks.addAll(newBooks);
    bestSellerPageNumber += 10;

    emit(LoadedBestSeller(bestSellerBooks));
  }

  Future<void> _loadMoreBestSellers() async {
    final newBooks = await booksApi.getBooks(bestSellerPageNumber);
    bestSellerBooks.addAll(newBooks);
    bestSellerPageNumber += 10;

    emit(LoadedBestSeller(bestSellerBooks));
  }

  Future<void> loadMoreItems(ScrollController scrollController) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await _loadMoreBestSellers();
      log(bestSellerPageNumber.toString());
    }
  }
}
