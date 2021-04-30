import 'package:flutter/material.dart';
import 'package:recipes_flutter/widget/main_drawer.dart';

class FillterSCreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFiltters;
  final Map<String, bool> currentFilters;
  FillterSCreen(this.currentFilters, this.saveFiltters);

  @override
  _FillterSCreenState createState() => _FillterSCreenState();
}

class _FillterSCreenState extends State<FillterSCreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;


  // @override
  // initState() {
  //   isGlutenFree = widget.currentFilters['gluten'];
  //   isLactoseFree = widget.currentFilters['lactose'];
  //   isVegetarian = widget.currentFilters['vegetarian'];
  //   isVegan = widget.currentFilters['vegan'];
  //   super.initState();
  // }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Fillter'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selecteFiltters = {
                    'gluten': isGlutenFree,
                    'lactos': isVegan,
                    'vegan': isVegetarian,
                    'vegetarian': isLactoseFree,
                  };

                  widget.saveFiltters(selecteFiltters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-free',
                      'Onle include gluten-free meals', isGlutenFree, (v) {
                    setState(() {
                      isGlutenFree = v;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan-free', 'Onle include Vegan-free meals', isVegan,
                      (v) {
                    setState(() {
                      isVegan = v;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian-free',
                      'Onle include Vegetarian-free meals', isVegetarian, (v) {
                    setState(() {
                      isVegetarian = v;
                    });
                  }),
                  _buildSwitchListTile(
                      'LactoseFree-free',
                      'Onle include LactoseFree-free meals',
                      isLactoseFree, (v) {
                    setState(() {
                      isLactoseFree = v;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
