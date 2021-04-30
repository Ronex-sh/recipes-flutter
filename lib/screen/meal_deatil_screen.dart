import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_flutter/dummy_data.dart';

class MealDeatilScreen extends StatelessWidget {
  static const routeName = "/meal-deatil";
  final Function tigleFavorite;
  final Function isMealFavorite;
  const MealDeatilScreen(this.tigleFavorite,this.isMealFavorite);

  buildTitleSection(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        '$text',
        style: GoogleFonts.indieFlower(
          textStyle: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.brown),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        height: 120,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //  final selectedMeal =
    //   DUMMY_MEALS.where((element) => element.id==mealId).toList();
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              // child: Image.network(selectedMeal[0].imageUrl),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleSection('ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 2,
                    child: Text(selectedMeal.ingredients[index]),
                  );
                },
              ),
            ),
            buildTitleSection('Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.red[100],
                    )
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> tigleFavorite(mealId),
        //  () {
        //   Navigator.of(context).pop(mealId);
        // },
        child: Icon(isMealFavorite(mealId)?Icons.star:Icons.star_border)
        
        //Icon(Icons.remove_circle),
      ),
    );
  }
}
