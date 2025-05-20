import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedImage extends StatelessWidget {
  RoundedImage({
    Key? key,
    required this.imagePath,
    this.borderRadius = 12.0,
    this.fit = BoxFit.fill,
    this.imageHeight = 100,
  }) : super(key: key);

  final String imagePath;
  final double borderRadius;
  final double imageHeight;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        height: imageHeight,
        imagePath,
        fit: fit,
        width: double.infinity,
      ),
    );
  }
}
