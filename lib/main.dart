import 'package:flutter/material.dart';
import 'package:recipes_flutter/screen/categories_screen.dart';
import 'package:recipes_flutter/screen/category_meal_screen.dart';
import 'package:recipes_flutter/screen/meal_deatil_screen.dart';
import 'package:recipes_flutter/screen/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
      home: TabsScreen(),
      routes: {
        // '/':(c)=> CategoriesScreen(),
        // '/category-meals':(c)=>CategoryMealScreen(),
        CategoryMealScreen.categoryMeal: (c) => CategoryMealScreen(),
        MealDeatilScreen.routeName: (c) => MealDeatilScreen(),
      },
      // onGenerateRoute: (s) {
      //   print(s.arguments);
      //   return MaterialPageRoute(builder: (c) => MealDeatilScreen());
      // },

      onUnknownRoute: (c){
        return MaterialPageRoute(builder: (c) => MealDeatilScreen());
      },
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
