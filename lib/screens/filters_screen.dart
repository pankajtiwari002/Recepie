import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String,bool> currentFilter;
  final Function saveFilter;
  FiltersScreen(this.currentFilter , this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutanFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    // print( widget.currentFilter['glutan']);
    _glutanFree = widget.currentFilter['glutanFree']!;
    _lactoseFree = widget.currentFilter['lactoseFree']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              final selctedFilter = {
                'glutanFree': _glutanFree,
                'lactoseFree': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selctedFilter);
            });
          },
           icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: const Text(
              'Adjust Your Meal Selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
              title: Text('Glutan-Free'),
              subtitle: Text('Only included glutan free meal'),
              value: _glutanFree,
              onChanged: (val) {
                setState(() {
                  _glutanFree = val;
                });
              },
          ),
          SwitchListTile(
              title: Text('Lactose-Free'),
              subtitle: Text('Only included lactose free meal'),
              value: _lactoseFree,
              onChanged: (val) {
                setState(() {
                  _lactoseFree = val;
                });
              },
          ),
          SwitchListTile(
              title: Text('Vegetarian-Free'),
              subtitle: Text('Only included Vegetarian meal'),
              value: _vegetarian,
              onChanged: (val) {
                setState(() {
                  _vegetarian = val;
                });
              },
          ),
          SwitchListTile(
              title: Text('Vegan'),
              subtitle: Text('Only included glutan free meal'),
              value: _vegan,
              onChanged: (val) {
                setState(() {
                  _vegan = val;
                });
              },
          ),
        ],
      ),
    );
  }
}
