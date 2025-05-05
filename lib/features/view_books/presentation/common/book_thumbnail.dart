import 'package:flutter/material.dart';

class BookThumbNail extends StatelessWidget {
  const BookThumbNail({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.imageURL,
    this.onTap,
  });
  final double width;
  final double height;
  final double borderRadius;
  final String imageURL;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageURL),
          ),
        ),
        child:
            onTap != null
                ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(borderRadius),
                    onTap: onTap,
                  ),
                )
                : null,
      ),
    );
  }
}
