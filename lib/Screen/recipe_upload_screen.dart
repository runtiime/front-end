import 'dart:io';
import 'package:capstone/Screen/recipe_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/image_upload_button.dart';
import '../util.dart';

class RecipeUploadScreen extends StatelessWidget {
  final double containerWidth = Util.getWidgetSize(1/3);

  RecipeUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.h),
            child: Padding(
              padding: EdgeInsets.only(top:20.0.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text(
                      'Recipe Upload',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
          SizedBox(height: 150.h),
          Center(
            child: ImageUploadButton(
              containerWidth: containerWidth,
              imageWidth: 40.w,
              onImageSelected: (File file) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailScreen(recipeId: 1),
                  ),
                );
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
