import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBarItem bottomNavBarItem({
  required String title,
  required String icon,
}) {
  return BottomNavigationBarItem(
    tooltip: title,
    label: title,
     icon: SizedBox(

       child: SvgPicture.asset(
         icon,
         width: 24.w,
         height: 24.h,
       ),
     )
  );
}
