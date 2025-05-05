import 'dart:async';

import 'package:bookly_app/config/navigation/route_constants.dart';
import 'package:bookly_app/config/theme/text_styles.dart';
import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:bookly_app/core/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() => _animate = true);
      }

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RouteConstants.homeRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: _animate ? Alignment.center : const Alignment(0, -2),
            child: SvgPicture.asset(AssetsPaths.logo, width: 160.w),
          ),
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment:
                _animate ? const Alignment(0, 0.2) : const Alignment(0, 2),
            child: Text(
              "Read Books",
              style: getMediumStyle(
                fontSize: 16.sp,
                color: AppColors.foreground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
