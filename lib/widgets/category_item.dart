import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    // navigate to a screen, needs to access context because the context stores
    // the position of widgets in the widget tree
    // pages are managed as a Stack, the top most page is visble to us
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return CategoryMealsScreen(id, title);
    //     },
    //   ),
    // ); // we need MaterialPageRoute as a wrapper to handle the animation of switching pages

    // push name to route in main.dart and pass arguments if needed
    Navigator.of(context)
        //.pushNamed('/category-meals', arguments: {'id': id, 'title': title});
        .pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    }); // use variable instead of hardcoding one
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // enable tapping on a widget, and add some effects on tapping
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
