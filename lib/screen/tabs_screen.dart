import 'package:flutter/material.dart';
import 'package:recipes_flutter/screen/categories_screen.dart';
import 'package:recipes_flutter/screen/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];
  int _sectedPageIndex = 0;
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
        title: Text('Meals'),
      ),
      body: _pages[_sectedPageIndex],
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
