import 'package:capstone/Widget/image_upload_button.dart';
import 'package:flutter/material.dart';
import '../Widget/recipe_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/search_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Fettuccine Alfredo',
      'description': 'Rich and creamy pasta recipe.',
      'image': 'assets/fettuccine.png',
    },
    {
      'name': 'Thai Green Curry',
      'description': 'Spicy and flavorful curry dish.',
      'image': 'assets/curry.png',
    },
    {
      'name': 'Blueberry Pancakes',
      'description': 'Perfect breakfast treat.',
      'image': 'assets/pancakes.png',
    },
    {
      'name': 'Margherita Pizza',
      'description': 'Simple and delicious pizza.',
      'image': 'assets/pizza.png',
    },
    {
      'name': 'Blueberry Pancakes',
      'description': 'Perfect breakfast treat.',
      'image': 'assets/pancakes.png',
    },
    {
      'name': 'Margherita Pizza',
      'description': 'Simple and delicious pizza.',
      'image': 'assets/pizza.png',
    },
    {
      'name': 'Blueberry Pancakes',
      'description': 'Perfect breakfast treat.',
      'image': 'assets/pancakes.png',
    },
    {
      'name': 'Margherita Pizza',
      'description': 'Simple and delicious pizza.',
      'image': 'assets/pizza.png',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0.w),
                    child: Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w,bottom: 20.0.h),
            child: Row(
              children: [
                Expanded(child: SearchTextField()),
                SizedBox(width: 10.w),
                ImageUploadButton(
                  onTap: () {},
                  containerWidth: 35.w,
                  imageWidth: 30.sp,
                  hasBorder: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GridView.builder(
                itemCount: recipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 7/10,
                ),
                itemBuilder: (context, index) {
                  return RecipeCard(recipe: recipes[index]);
                },
              ),
            ),
          ),
              ],
            ),
      );
  }
}
