import 'package:app_2/screens/inventory_add_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/inventory_grid.dart';

// this screen shows the main inventory list which is made up of
// InventoryGrid -> InventoryItem
class InventoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory List'),
        actions: <Widget>[
          // add inventory button
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(InventoryAddScreen.routeName);
            },
            iconSize: 32.0,
          ),
        ],
      ),
      body: InventoryGrid(),
    );
  }
}
