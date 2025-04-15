import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final double imageWidth = Util.getWidgetSize(0.27);

  RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r),
      side: BorderSide(
        color:Color(0xffF0F0F0),
        width: 1,
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: Container(
                width: imageWidth,
                height: imageWidth * (13 / 11),
                child: Image.asset(
                  recipe['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                recipe['name'],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:8.0.h),
              child: Text(
                recipe['description'],
                style: TextStyle(
                  fontSize: 8.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFFE6B277),
                side: BorderSide(color: Color(0xFFE6B277)),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'View Recipe',
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
