

import 'package:flutter/material.dart';
import 'package:recipes_flutter/widget/main_drawer.dart';

class FillterSCreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Fillter'),),
      drawer: MainDrawer(),

      body: Text('filtter'),
    );
  }
}
