import 'package:flutter/material.dart';
import 'package:recipes_flutter/screen/category_meal_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String categoryId;

  CategoryItem(this.title, this.color, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   '/category-meals',arguments: {'categoryId':categoryId,'title':title}
        // );
        Navigator.of(context).pushNamed(CategoryMealScreen.categoryMeal,
            arguments: {'categoryId': categoryId, 'title': title});
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          // style: Theme.of(context).textTheme.bodyText1,
          style: GoogleFonts.berkshireSwash(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(27),
        ),
      ),
    );
  }
}
