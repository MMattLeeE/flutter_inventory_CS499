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
      ),
      body: InventoryGrid(),
    );
  }
}
