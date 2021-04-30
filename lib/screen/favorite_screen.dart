import 'package:flutter/material.dart';
import 'package:recipes_flutter/model/meal.dart';
import 'package:recipes_flutter/widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
 final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        body: Text('you dont have favorite yet .... '),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (_, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          
          );
        },
      );
    }
  }
}
