import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // by doing this, tabScreen will have full control of the screen
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
      //action: ....   we can what ever we want 
    },
    {
      'page': FavoritesScreen(widget.favoriteMeals), // widget will first avaiable in the initState
      'title': 'Your Favorites',
    },
  ];
    super.initState();
  }

  // flutter will pass the index of the seleted tab
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      // add tabs at the bottom
      bottomNavigationBar: BottomNavigationBar(
        // onTap is fired whenever a tab is seleted
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:
            _selectedPageIndex, // tell the navigation bar which tab is seleted !!important
        //selectedFontSize: , change the default setting of the font size
        //unselectedFontSize: ,
        // type: BottomNavigationBarType.shifting, // this change the animation of the navigation bar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ), // this is just a tab
        ],
      ),
    );

    // // DefaultTabController is for building tabs at the top of your screen
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0, // first tab is seleted by default
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.star,
    //             ),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [CategoriesScreen(), FavoritesScreen()],
    //     ),
    //   ),
    // );
  }
}
