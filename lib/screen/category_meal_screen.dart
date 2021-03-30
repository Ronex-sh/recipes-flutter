import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_flutter/dummy_data.dart';
import 'package:recipes_flutter/widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const categoryMeal = '/category-meals';
  // const CategoryMealScreen(this.categoryId, this.title);
  // final String title;
  // final categoryId;

  @override
  Widget build(BuildContext context) {
    final routeARG =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeARG['title'];
    final categoryId = routeARG['categoryId'];
    final categoryMeal = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
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
          );
        },
      ),
    );
  }
}
