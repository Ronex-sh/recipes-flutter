import 'package:flutter/material.dart';
import 'package:recipes_flutter/screen/categories_screen.dart';
import 'package:recipes_flutter/screen/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('data'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'categories',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'favorite',
            )
          ]),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoriteScreen()],
        ),
      ),
    );
  }
}
