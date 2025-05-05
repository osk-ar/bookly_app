import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/constants/assets_paths.dart';
import 'package:bookly_app/features/view_books/presentation/common/default_icon_button.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/best_seller_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/cubits/featured_cubit.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/best_seller_list.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/best_seller_shimmer.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/featured_books_item.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/featured_books_slider.dart';
import 'package:bookly_app/features/view_books/presentation/home/widgets/featured_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FeaturedCubit _featuredCubit;
  late final BestSellerCubit _bestSellerCubit;
  late final ScrollController _scrollController;
  @override
  void initState() {
    _featuredCubit = context.read<FeaturedCubit>();
    _bestSellerCubit = context.read<BestSellerCubit>();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      _bestSellerCubit.loadMoreItems(_scrollController);
    });

    _featuredCubit.loadFeatured();
    _bestSellerCubit.loadBestSellers();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          //* appbar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AssetsPaths.logo, height: 16.h),
                  DefaultIconButton(onPressed: () {}, icon: Icons.search),
                ],
              ),
            ),
          ),

          //* featured scroll
          BlocBuilder<FeaturedCubit, FeaturedState>(
            builder: (context, state) {
              switch (state) {
                case LoadingFeatured():
                  return SliverToBoxAdapter(
                    child: FeaturedShimmer(height: 224.h),
                  );

                case LoadedFeatured():
                  return SliverToBoxAdapter(
                    child: FeaturedBooksSlider(
                      height: 224.h,
                      items:
                          state.books.map((book) {
                            return Builder(
                              builder: (BuildContext context) {
                                return FeaturedBooksItem(
                                  imgURL: book.imageLinks.thumbNail,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteConstants.bookDetailsRoute,
                                      arguments: book.id,
                                    );
                                  },
                                );
                              },
                            );
                          }).toList(),
                    ),
                  );

                default:
                  return SliverToBoxAdapter(
                    child: FeaturedShimmer(height: 224.h),
                  );
              }
            },
          ),

          SliverToBoxAdapter(child: SizedBox(height: 48.h)),

          //* best sellers title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Best Seller",
                style: getBoldStyle(
                  fontSize: 18.sp,
                  color: AppColors.foreground,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          //* best sellers scroll
          BlocBuilder<BestSellerCubit, BestSellerState>(
            builder: (context, state) {
              switch (state) {
                case LoadingBestSeller():
                  return SliverToBoxAdapter(child: ShimmerList());

                case LoadedBestSeller():
                  return BestSellerList(isLoading: false, books: state.books);

                default:
                  return SliverToBoxAdapter(child: ShimmerList());
              }
            },
          ),
        ],
      ),
    );
  }
}
