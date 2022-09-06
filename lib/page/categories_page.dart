import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map(
            (dumCat) => CategoryItem(
              id: dumCat.id,
              title: dumCat.title,
              color: dumCat.color,
            ),
          )
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
