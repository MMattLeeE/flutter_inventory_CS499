import 'package:app_2/providers/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inventory_provider.dart';

class InventoryEditScreen extends StatelessWidget {
  static const routeName = '/inventory_edit';

  @override
  Widget build(BuildContext context) {
    final inventoryId =
        ModalRoute.of(context).settings.arguments as String; // provides id
    // does not rebuild due to changes in data as the view only looks
    // at one inventory item when editing
    final loadedInventory = Provider.of<InventoryProvider>(
      context,
      listen: false, //does not rebuild due to data change
    ).findById(inventoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedInventory.title),
      ),
    );
  }
}
