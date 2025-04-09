import 'package:capstone/Widget/menu_sort_icon.dart';
import 'package:capstone/Widget/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/recipe_item.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Fettuccine Alfredo',
      'description': 'Rich and creamy pasta recipe.',
      'favorite': false,
      'image': 'assets/fettuccine.png',
    },
    {
      'name': 'Thai Green Curry',
      'description': 'Spicy and flavorful curry dish.',
      'favorite': true,
      'image': 'assets/curry.png',
    },
    {
      'name': 'Blueberry Pancakes',
      'description': 'Perfect breakfast treat.',
      'favorite': false,
      'image': 'assets/pancakes.png',
    },
    {
      'name': 'Margherita Pizza',
      'description': 'Simple and delicious pizza.',
      'favorite': false,
      'image': 'assets/pizza.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
                    'My Page',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MenuSortIcon(onPressed: () {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 5.0.h),
            child: SearchTextField(),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFFC68F51),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFC68F51),
            tabs: [
              Tab(text: 'Recipe Log'),
              Tab(text: 'Favorites'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeItem(recipe: recipes[index]);
                  },
                ),
                Center(child: Text('Favorites will be shown here')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
