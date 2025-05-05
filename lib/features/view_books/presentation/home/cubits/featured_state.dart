part of 'package:bookly_app/features/view_books/presentation/home/cubits/featured_cubit.dart';

class FeaturedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeaturedInitial extends FeaturedState {}

class LoadingFeatured extends FeaturedState {}

class LoadedFeatured extends FeaturedState {
  final List<BookModel> books;
  LoadedFeatured(this.books);

  @override
  List<Object?> get props => [books];
}
