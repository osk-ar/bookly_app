import 'package:bookly_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.foreground),
      iconSize: 25.r,
    );
  }
}
