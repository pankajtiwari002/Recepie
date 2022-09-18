import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function changeFavourite;
  final Function isFavouriteMeal;

  MealDetailScreen(this.isFavouriteMeal,this.changeFavourite);

  Widget buildSectionTitle(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 170,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(((meal) => meal.id == mealId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(selectedMeal.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      color: Colors.white54,
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink,
                          child:Text('# ${index+1}')
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                }),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeFavourite(mealId);
        },
        child: isFavouriteMeal(mealId)?const Icon(Icons.star):const Icon(Icons.star_outline),
        ),
    );
  }
}
