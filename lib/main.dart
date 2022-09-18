import'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'glutanFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> available_Meal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      available_Meal=DUMMY_MEALS.where((meal) {
        if((_filters['glutanFree']!) && !meal.isGlutenFree){
          return false;
        }
        if((_filters['lactoseFree']!) && !meal.isLactoseFree){
          return false;
        }
        if((_filters['vegan']!) && !meal.isVegan){
          return false;
        }
        if((_filters['vegetarian']!) && !meal.isVegetarian){
          return false;
        }
        // print(meal.title);
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
    final _recentIndex = _favouriteMeal.indexWhere((meal) => meal.id==mealId);
    if(_recentIndex>=0){
      setState(() {
        _favouriteMeal.removeAt(_recentIndex);
      });
    }
    else{
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool _isMealFavourite(String mealId){
    return _favouriteMeal.any((meal) => meal.id==mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TabsScreen(),
      routes: {
        "/" : (ctx) => TabsScreen(_favouriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(available_Meal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_isMealFavourite,_toggleFavourite),
      },
    );
  }
}

