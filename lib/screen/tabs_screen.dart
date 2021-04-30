import 'package:flutter/material.dart';
import 'package:recipes_flutter/model/meal.dart';
import 'package:recipes_flutter/screen/categories_screen.dart';
import 'package:recipes_flutter/screen/favorite_screen.dart';
import 'package:recipes_flutter/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
 final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;
  int _sectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'}
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _sectedPageIndex = index;
      //print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_sectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_sectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: _selectPage,
        unselectedItemColor: Colors.brown,
        currentIndex: _sectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorites',
          ),
        ],
      ),
    );
  }
}
