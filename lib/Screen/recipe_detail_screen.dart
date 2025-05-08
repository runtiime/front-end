import 'package:capstone/Widget/servings_icon.dart';
import 'package:capstone/Widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/ingredient_chip.dart';

class RecipeDetailScreen extends StatefulWidget {
  final int recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int servings = 1;

  String foodName = "";
  String imagePath = "";
  List<String> directions = [];
  List<String> ingredients = [];

  String? selectedIngredient;

  @override
  void initState() {
    super.initState();
    _loadRecipeData();
  }

  void _loadRecipeData() {
    if (widget.recipeId == 1) {
      foodName = "Fettuccine Alfredo";
      imagePath = "assets/fettuccine.png";
      directions = [
        "1. Preheat oven to 350F (175C). Grease an 8-inch square baking pan.",
        "2. In a bowl, mix flour, sugar, baking powder, and salt.",
        "3. Add butter, vanilla, and eggs; stir until smooth. Fold in chocolate chips.",
        "4. Spread batter in pan and bake for 20-25 minutes."
      ];
      ingredients = [
        'flour',
        '2/3 cup sugar',
        '1/2 tsp baking powder',
        'salt',
        '1/3 cup butter, melted',
        '1 tsp vanilla extract',
        '2 large eggs',
        '1/2 cup chocolate chips',
      ];
    } else if (widget.recipeId == 2) {
      foodName = "Spaghetti Carbonara";
      imagePath = "assets/spaghetti.png";
      directions = [
        "1. Cook pasta according to package instructions.",
        "2. In a bowl, whisk together eggs, cheese, and pepper.",
        "3. Combine pasta with the egg mixture and bacon, stirring quickly to create a creamy sauce.",
        "4. Serve with extra grated cheese and black pepper."
      ];
      ingredients = [
        '200g spaghetti',
        '100g bacon, chopped',
        '2 large eggs',
        '1/2 cup grated Parmesan cheese',
        'Fresh black pepper',
      ];
    } else {
      foodName = "Unknown Recipe";
      imagePath = "assets/default.png";
      directions = ["No directions available."];
      ingredients = ["No ingredients available."];
    }

    setState(() {});
  }

  TextSpan highlightIngredientInDirection(String direction, String? selectedIngredient) {
    if (selectedIngredient == null || direction.isEmpty) {
      return TextSpan(text: direction);
    }

    final lowerCaseDirection = direction.toLowerCase();
    final lowerCaseIngredient = selectedIngredient.toLowerCase();
    final parts = <TextSpan>[];
    int start = 0;

    while (true) {
      final index = lowerCaseDirection.indexOf(lowerCaseIngredient, start);
      if (index == -1) {
        parts.add(TextSpan(text: direction.substring(start)));
        break;
      }

      // 이전 일반 텍스트
      if (index > start) {
        parts.add(TextSpan(text: direction.substring(start, index)));
      }

      // 하이라이트된 부분
      parts.add(TextSpan(
        text: direction.substring(index, index + selectedIngredient!.length),
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Color(0xFFE1CEC4),
          fontWeight: FontWeight.bold,
        ),
      ));

      start = index + selectedIngredient.length;
    }

    return TextSpan(children: parts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(foodName, style: TextStyle(fontSize: 24.sp)),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 22.0.w),
            child: Icon(Icons.edit),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                imagePath,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Servings", style: TextStyle(fontSize: 16.sp)),
              SizedBox(width: 10.w),
              ServingsIcon(
                  iconName: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (servings > 1) {
                        servings--;
                      }
                    });
                  },
                  backgroundColor: Color(0xFFF3F4F6),
                  iconColor: Color(0xFF565D6D)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Text(servings.toString(),
                    style: TextStyle(fontSize: 16.sp)),
              ),
              ServingsIcon(
                  iconName: Icons.add,
                  onPressed: () {
                    setState(() {
                      servings++;
                    });
                  },
                  backgroundColor: Color(0xFFFFCEAD6),
                  iconColor: Color(0xFF894E0A)),
            ],
          ),
          SizedBox(height: 20.h),
          Text("Ingredients",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: ingredients.map((ingredient) {
              return IngredientChip(
                text: ingredient,
                isSelected: selectedIngredient == ingredient,
                onTap: (ingredient) {
                  setState(() {
                    selectedIngredient = selectedIngredient == ingredient ? null : ingredient;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          Text("Directions",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: directions.map((direction) {
              return Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text.rich(
                  highlightIngredientInDirection(direction, selectedIngredient),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 30.h),
          SubmitButton(text: "Start", onPressed: () {})
        ],
      ),
    );
  }
}
