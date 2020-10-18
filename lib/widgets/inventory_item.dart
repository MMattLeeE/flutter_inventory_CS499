import 'package:flutter/material.dart';

//Each individual inventory Item and how to render it. This case using a
//GridTile. The InventoryItem is instantiated in the
//inventory_overview_screen.dart in the GridView for each grid Item

class InventoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  InventoryItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl),
    );
  }
}
