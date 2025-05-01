import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double borderRadius;
  final BoxFit fit;

  const RoundedImage({
    Key? key,
    required this.imagePath,
    this.borderRadius = 12.0,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imagePath,
        fit: fit,
      ),
    );
  }
}
