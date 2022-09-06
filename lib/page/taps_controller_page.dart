import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './favorities_page.dart';
import 'categories_page.dart';

class TapsControllerPage extends StatefulWidget {
  const TapsControllerPage(this.favoritesMeal, {Key? key}) : super(key: key);
  final List<Meal> favoritesMeal;

  @override
  State<TapsControllerPage> createState() => _TapsControllerPageState();
}

class _TapsControllerPageState extends State<TapsControllerPage> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritiesPage(widget.favoritesMeal),
        'title': 'Favorites',
      },
    ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
