import 'package:active_bee/core/cubit/favorite_cubit.dart';
import 'package:active_bee/core/theme/app_colors.dart';
import 'package:active_bee/core/widgets/custom_circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteSearchShareBar extends StatelessWidget {
  FavoriteSearchShareBar({super.key, required this.onSharePressed});
  final void Function() onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleIconButton(
          icon: Icons.arrow_back_ios_new_sharp,
          onPressed: () => Navigator.pop(context),
        ),
        Row(
          children: [
            CustomCircleIconButton(
                icon: Icons.share, onPressed: onSharePressed),
            SizedBox(width: 8.w),
            CustomCircleIconButton(icon: Icons.search, onPressed: () {}),
            SizedBox(width: 8.w),
            BlocBuilder<FavoriteCubit, bool>(
              builder: (context, isFavorite) {
                return CustomCircleIconButton(
                  icon: isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  onPressed: () =>
                      context.read<FavoriteCubit>().toggleFavorite(),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
