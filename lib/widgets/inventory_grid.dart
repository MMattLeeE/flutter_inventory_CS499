import 'package:app_2/providers/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/inventory_item.dart';
import '../providers/inventory_provider.dart';

// the overview screen contains the InventoryGrid widget;
// the InventoryGrid is made up of InventoryItems widgets
class InventoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the listener to the provider if there is one up the widget tree
    // only this and its children rebuild. Inventory grabbing an instance
    // of InventoryProvider through the context
    var inventoryData = Provider.of<InventoryProvider>(context);
    var inventory = inventoryData.items;

    return GridView.builder(
      // padding: const EdgeInsets.all(10.0),
      itemCount: inventory.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //create: (c) => inventory[i],
        value: inventory[i],
        child: InventoryItem(),
      ), //define how every gridcell is built
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //number of columns
        childAspectRatio: 6 / 2,
        // crossAxisSpacing: 30, //spacing between columns
        mainAxisSpacing: 0, //spacing between rows
      ),
    );
  }
}
