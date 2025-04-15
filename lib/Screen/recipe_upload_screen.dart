import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/image_upload_button.dart';
import '../util.dart';

class RecipeUploadScreen extends StatelessWidget {
  final double containerWidth = Util.getWidgetSize(1);

  RecipeUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'Recipe Upload',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Upload Image',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE6B277),
                ),
              ),
              SizedBox(height: 4.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1.h,
                    width: containerWidth,
                    color: Colors.grey[300],
                  ),
                  Container(
                    height: 2.h,
                    width: 100.w,
                    color: Color(0xFFE6B277),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 60.h),
          Center(
            child: ImageUploadButton(
              containerWidth: 100.w,
              imageWidth: 40.w,
              onTap: () {
                // Handle image upload action here
              },
            ),
          ),

          SizedBox(height: 20.h),
          Text(
            'Please click the button\nabove to upload your recipe image',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
