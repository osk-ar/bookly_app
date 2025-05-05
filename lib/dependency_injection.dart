import 'package:bookly_app/features/view_books/data/api/books_api.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/book_details_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/best_seller_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/featured_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initDependencies() {
  Dio dio = Dio();

  getIt.registerSingleton<BooksApi>(BooksApi(dio));
  getIt.registerFactory<FeaturedCubit>(() => FeaturedCubit(getIt()));
  getIt.registerFactory<BestSellerCubit>(() => BestSellerCubit(getIt()));

  getIt.registerFactory<BookDetailsCubit>(() => BookDetailsCubit(getIt()));
  getIt.registerFactory<SimilarBooksCubit>(() => SimilarBooksCubit(getIt()));
}
