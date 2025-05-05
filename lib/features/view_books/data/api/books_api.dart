import 'dart:developer';

import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/core/models/detailed_book_model.dart';
import 'package:dio/dio.dart';

class BooksApi {
  final Dio dio;
  final baseURL = "https://www.googleapis.com/books/v1/volumes";
  BooksApi(this.dio);

  Future<List<BookModel>> getBooks(int startIndex) async {
    Response response;

    try {
      response = await dio.get(
        baseURL,
        queryParameters: {'q': "adventure", 'startIndex': startIndex},
      );

      if (response.statusCode == 200) {
        return (response.data["items"] as List)
            .map((item) => BookModel.fromJson(item))
            .toList();
      } else {
        log(
          "Error -- StatusCode: ${response.statusCode}, StatusMessage: ${response.statusMessage}",
        );
      }

      return [];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<DetailedBookModel> getBookDetails(String id) async {
    Response response;

    try {
      response = await dio.get('$baseURL/$id');

      if (response.statusCode == 200) {
        return DetailedBookModel.fromJson(response.data);
      } else {
        log(
          "Error -- StatusCode: ${response.statusCode}, StatusMessage: ${response.statusMessage}",
        );
      }

      return DetailedBookModel.empty();
    } on Exception catch (e) {
      log(e.toString());
      return DetailedBookModel.empty();
    }
  }
}
