import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20
          ),
          children: DUMMY_CATEGORIES
            .map((catData) =>CategoryItem(
              id:catData.id,
              title:catData.title,
              color:catData.color
            ),
            ).toList(),
    );
  }
}