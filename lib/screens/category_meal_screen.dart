import'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/catalog-meal';
  final List<Meal> available_Meal;

  CategoryMealScreen(this.available_Meal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String categoryTitle = routeArgs['title'].toString() ;
    String categoryId = routeArgs['id'].toString();
    List<Meal> categoryMeal = widget.available_Meal.where((meal){
      print(meal.title);
      return meal.categories.contains(categoryId);
    } ).toList();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          id: categoryMeal[index].id,
          title: categoryMeal[index].title,
          affordability: categoryMeal[index].affordability,
          complexity: categoryMeal[index].complexity,
          duration: categoryMeal[index].duration,
          imageUrl: categoryMeal[index].imageUrl,
          );
      },
      itemCount: categoryMeal.length,
      ),
    );
  }
}