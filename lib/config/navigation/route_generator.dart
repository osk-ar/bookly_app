import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/dependency_injection.dart';
import 'package:bookly_app/features/boarding/presentation/splash_screen.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/book_details_page.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/book_details_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/book_details/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/best_seller_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/featured_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashRoute:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case RouteConstants.homeRoute:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<FeaturedCubit>()),
                BlocProvider(create: (context) => getIt<BestSellerCubit>()),
              ],
              child: HomePage(),
            );
          },
        );
      case RouteConstants.bookDetailsRoute:
        final String id = (settings.arguments as String);
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<BookDetailsCubit>()),
                BlocProvider(create: (context) => getIt<SimilarBooksCubit>()),
              ],
              child: BookDetailsPage(bookID: id),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
    }
  }
}
