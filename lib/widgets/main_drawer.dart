import 'package:flutter/material.dart';

import '../page/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildTiles(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black54,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobontoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildTiles('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          const Divider(
            color: Colors.black,
          ),
          buildTiles('Filters', Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersPage.filtersRoute);
          }),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
