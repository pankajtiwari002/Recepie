import 'package:flutter/material.dart';
import 'package:recepie_app/screens/categories_screen.dart';
import 'package:recepie_app/screens/filters_screen.dart';
import 'package:recepie_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      onTap: (){tapHandler();},
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            child: const Text(
              'Cooking!',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed("/");
            }
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
