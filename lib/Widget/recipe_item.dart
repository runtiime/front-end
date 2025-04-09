import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util.dart';
import 'heart_icon.dart';

class RecipeItem extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final double imageWidth = Util.getWidgetSize(1 / 7);

  RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.w),
            child: SizedBox(
              width: imageWidth,
              height: imageWidth,
              child: Image.asset(
                recipe['image'],
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          recipe['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    HeartIcon(initialFavorite: recipe['favorite']),
                  ],
                ),
                // SizedBox(height: 2.h),
                Text(
                  recipe['description'],
                  style: TextStyle(fontSize: 8.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
