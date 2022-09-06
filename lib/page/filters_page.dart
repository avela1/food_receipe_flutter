import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  static const filtersRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _gluetenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegiterian = false;

  @override
  void initState() {
    _gluetenFree = widget.currentFilters['glueten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegiterian = widget.currentFilters['vegiterian']!;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool value,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: (newValue) {
        setState(() {
          switch (title) {
            case 'Glueten-Free':
              _gluetenFree = newValue;
              break;
            case 'Lactose-Free':
              _lactoseFree = newValue;
              break;
            case 'Vegan':
              _vegan = newValue;
              break;
            case 'Vegiterian':
              _vegiterian = newValue;
              break;
            default:
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('categoryTitle'),
        actions: [
          IconButton(
            onPressed: () {
              final filters = {
                'glueten': _gluetenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegiterian': _vegiterian,
              };
              widget.saveFilters(filters);
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Select Your Category choice',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Glueten-Free',
                'only includes gluten free meals',
                _gluetenFree,
              ),
              _buildSwitchListTile(
                'Lactose-Free',
                'only includes Lactose free meals',
                _lactoseFree,
              ),
              _buildSwitchListTile(
                'Vegan',
                'only includes vegan meals',
                _vegan,
              ),
              _buildSwitchListTile(
                'Vegiterian',
                'only includes Vegiterian meals',
                _vegiterian,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
