
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircleIconButton extends StatelessWidget {
  final double radius;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const CustomCircleIconButton({
    Key? key,
    this.radius = 20,
    this.backgroundColor = AppColors.whiteColor,
    required this.icon,
    this.iconColor = AppColors.secondaryColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
