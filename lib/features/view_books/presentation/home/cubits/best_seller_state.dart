part of 'package:bookly_app/features/view_books/presentation/home/cubits/best_seller_cubit.dart';

class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class LoadingBestSeller extends BestSellerState {}

class LoadedBestSeller extends BestSellerState {
  final List<BookModel> books;
  LoadedBestSeller(this.books);
}
