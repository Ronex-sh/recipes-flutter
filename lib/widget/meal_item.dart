import 'package:flutter/material.dart';
import 'package:recipes_flutter/model/meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_flutter/screen/meal_deatil_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {@required this.id,
        @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDeatilScreen.routeName,arguments: id);
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Challenging:
        return "challenging";
        break;
      case Complexity.Hard:
        return "hard";
        break;
      default:
        return "unkown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return "price";
        break;
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "unkown";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.network(
                    imageUrl,
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: 40,
                    right: 10,
                    child: Container(
                      color: Colors.black45,
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Text(
                        title,
                        style: GoogleFonts.indieFlower(
                          textStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('$duration Min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.handyman_sharp),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
