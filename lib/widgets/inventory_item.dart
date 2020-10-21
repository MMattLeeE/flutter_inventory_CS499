import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/inventory_edit_screen.dart';
import '../providers/inventory.dart';
import '../providers/inventory_provider.dart';
//Each individual inventory Item and how to render it. This case using a
//GridTile. The InventoryItem is instantiated in the
//inventory_overview_screen.dart in the GridView for each grid Item

class InventoryItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final int count;

  // InventoryItem(this.id, this.title, this.imageUrl, this.count);

  @override
  Widget build(BuildContext context) {
    final inventory = Provider.of<Inventory>(context);
    return GridTile(
      child: Padding(
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 10,
          right: 10,
        ),
        child: GridTileBar(
          backgroundColor: Theme.of(context).backgroundColor,
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete_rounded),
                iconSize: 32.0,
                onPressed: () {
                  Provider.of<InventoryProvider>(context, listen: false)
                      .deleteInventory(inventory.id);
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_upward),
                iconSize: 32.0,
                onPressed: () {
                  inventory.incrementCount();
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward),
                iconSize: 32.0,
                onPressed: () {
                  inventory.decrementCount();
                },
              ),
              Text(
                inventory.count.toString(),
                textScaleFactor: 1.5,
              )
            ],
          ),
          title: Text(
            inventory.title,
            textScaleFactor: 1.5,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      footer: Container(
        //edit button
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              InventoryEditScreen.routeName,
              arguments: inventory.id,
            );
          },
          child: Text('Edit'),
        ),
      ),
    );
  }
}
