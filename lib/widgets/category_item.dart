import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.id,required this.title,required this.color});

  void selectScreen (ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      }
      );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectScreen(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7),color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
    
          ),
          ),
      ),
    );
  }
}