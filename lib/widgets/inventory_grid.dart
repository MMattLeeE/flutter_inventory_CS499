import 'package:app_2/providers/inventory_provider.dart';
import 'package:flutter/material.dart';

import '../widgets/inventory_item.dart';
import '../providers/inventory_provider.dart';
import 'package:provider/provider.dart';

// the overview screen contains the InventoryGrid widget;
// the InventoryGrid is made up of InventoryItems widgets
class InventoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the listener to the provider if there is one up the widget tree
    // only this and its children rebuild. Inventory grabbing an instance
    // of InventoryProvider through the context
    final inventoryData = Provider.of<InventoryProvider>(context);
    final inventory = inventoryData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: inventory.length,
      itemBuilder: (ctx, i) => InventoryItem(
        inventory[i].id,
        inventory[i].title,
        inventory[i].imageUrl,
        inventory[i].count,
      ), //define how every gridcell is built
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //number of columns
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 10, //spacing between columns
        mainAxisSpacing: 10, //spacing between rows
      ),
    );
  }
}
