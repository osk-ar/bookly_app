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

    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _animate = true;
      });
    });

    // Navigate to next screen after some delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteConstants.homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _animate ? size.height / 2 - 50 : -40,
            left: size.width / 2 - 80,
            child: SvgPicture.asset(AssetsPaths.logo, width: 160),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _animate ? size.height / 2 : size.height + 50,
            left: size.width / 2 - 50,
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
