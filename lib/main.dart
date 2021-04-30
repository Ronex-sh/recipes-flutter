import 'package:flutter/material.dart';
import 'package:recipes_flutter/dummy_data.dart';
import 'package:recipes_flutter/model/meal.dart';

import 'package:recipes_flutter/screen/category_meal_screen.dart';
import 'package:recipes_flutter/screen/fillter_screen.dart';
import 'package:recipes_flutter/screen/meal_deatil_screen.dart';
import 'package:recipes_flutter/screen/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  @override
  void initState() {
    // print(_availableMeals);
    super.initState();
  }

  void _setFiltters(Map<String, bool> filtterData) {
    setState(() {
      _filtters = filtterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filtters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filtters['lactos'] && !element.isLactoseFree) {
          return false;
        }
        if (_filtters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filtters['vegetarian'] && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
      // print(_availableMeals);
    });
  }

  void _tigleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeal.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.amber,

        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       bodyText1: TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),

        //       ),
        //       bodyText2: TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),
        //       ),
        //       headline1:
        //           TextStyle(fontFamily: 'RobotoCandensed', fontSize: 24),
        //     )
      ),
      home: TabsScreen(_favoriteMeal),
      routes: {
        // '/':(c)=> CategoriesScreen(),
        // '/category-meals':(c)=>CategoryMealScreen(),
        CategoryMealScreen.categoryMeal: (c) =>
            CategoryMealScreen(_availableMeals),
        MealDeatilScreen.routeName: (c) => MealDeatilScreen(_tigleFavorite,_isMealFavorite),
        FillterSCreen.routeName: (c) => FillterSCreen(_filtters, _setFiltters)
      },
      // onGenerateRoute: (s) {
      //   print(s.arguments);
      //   return MaterialPageRoute(builder: (c) => MealDeatilScreen());
      // },

      // onUnknownRoute: (c) {
      //   return MaterialPageRoute(builder: (c) => MealDeatilScreen());
      // },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//     @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child: CategoriesScreen(),
//       ),
//     );
//   }
// }
