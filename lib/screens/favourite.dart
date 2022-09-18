import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favourite extends StatelessWidget {
  final List<Meal> favouriteMeal;
  Favourite(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    return (favouriteMeal.isEmpty)?const Center(
      child: Text('No Favourite is added yet - add some'),
    ):
    ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          id: favouriteMeal[index].id,
          title: favouriteMeal[index].title,
          affordability: favouriteMeal[index].affordability,
          complexity: favouriteMeal[index].complexity,
          duration: favouriteMeal[index].duration,
          imageUrl: favouriteMeal[index].imageUrl,
          );
      },
      itemCount: favouriteMeal.length,
      );
  }
}
