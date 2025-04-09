import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuSortIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuSortIcon({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
