import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServingsIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconName;
  final Color backgroundColor;
  final Color iconColor;

  const ServingsIcon({
    super.key,
    required this.onPressed, required this.iconName, required this.backgroundColor, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(0.0.w),
            child: Icon(iconName, color: iconColor,size: 15.sp,),
          ),
        )
    );
  }
}
