import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // since categories are not changing, we don't need to
    // use builder
    return Scaffold( // every screen is likely to have a Scaffold widget 
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((categoryData) => CategoryItem(
                  categoryData.id,
                  categoryData.title,
                  categoryData.color,
                ))
            .toList(),
        // define a maximum width for each grid item, and it will automatically creates
        // as many columns as we can fit items with that provided width next to each other
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // for 200 width, there is 300 height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
