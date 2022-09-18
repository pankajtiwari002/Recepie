import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourite.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final favouriteMeal;
  TabsScreen(this.favouriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String,Object>> _pages;

  int _selectedPageIndex = 0;
  void _selctedPage(int index){
    _selectedPageIndex = index;
    setState(() {});
  }
  @override
  void initState() {
    _pages = [
    {'pages': CategoriesScreen(),'title': 'Categories'},
    {'pages': Favourite(widget.favouriteMeal),'title': 'Your Favourites'}
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // ignore: sort_child_properties_last
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(_pages[_selectedPageIndex]['title'] as String)
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['pages'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink,
          onTap: _selctedPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
            ),
        ]),
      ),
      length: 2,
    );
  }
}
