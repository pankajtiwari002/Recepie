import 'package:flutter/material.dart';
import 'package:recepie_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.complexity,
      required this.affordability,
      required this.duration});

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;  
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordablityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;  
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(context){
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(15),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      width: 220,
                      color: Colors.black54,
                      child: Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                      )
                      ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordablityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
