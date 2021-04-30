import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipes_flutter/model/meal.dart';
import 'package:recipes_flutter/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const categoryMeal = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeal;
  // bool _loadedInatData = false;
  @override
  // void initState() {
  //   final routeARG =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   categoryTitle = routeARG['title'];
  //   final categoryId = routeARG['categoryId'];
  //   categoryMeal = DUMMY_MEALS
  //       .where((element) => element.categories.contains(categoryId))
  //       .toList();
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    final routeARG =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeARG['title'];
    final categoryId = routeARG['categoryId'];
    // categoryMeal = DUMMY_MEALS
    //     .where((element) => element.categories.contains(categoryId))
    //     .toList();
    // 
    categoryMeal = widget.availableMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();

    super.didChangeDependencies();
  }

  // void _removeId(String mealId) {
  //   setState(() {
  //     categoryMeal.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: GoogleFonts.berkshireSwash(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black)),
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (_, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
            //removeItem: _removeId,
          );
        },
      ),
    );
  }
}
