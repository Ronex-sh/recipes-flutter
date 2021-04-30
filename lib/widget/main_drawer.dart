import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_flutter/screen/fillter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.black54,
      ),
      title: Text(
        title,
        style: GoogleFonts.berkshireSwash(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 29)),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                'Cooking Up!!',
                style: GoogleFonts.berkshireSwash(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white)),
              ),
            ),
            color: Colors.brown,
          ),
          SizedBox(
            height: 5,
          ),
          buildListTile('Meals', Icons.restaurant_rounded, () {
           // Navigator.of(context).pushNamed('/');
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Fillters', Icons.settings, () {
            // Navigator.of(context).pushNamed(FillterSCreen.routeName);
             Navigator.of(context).pushReplacementNamed(FillterSCreen.routeName);
          })
        ],
      ),
    );
  }
}
