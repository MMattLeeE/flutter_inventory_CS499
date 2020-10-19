import 'package:flutter/material.dart';

//Each individual inventory Item and how to render it. This case using a
//GridTile. The InventoryItem is instantiated in the
//inventory_overview_screen.dart in the GridView for each grid Item

class InventoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int count;

  InventoryItem(this.id, this.title, this.imageUrl, this.count);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GridTileBar(
        backgroundColor: Colors.grey,
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_rounded),
              iconSize: 32.0,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.arrow_upward),
              iconSize: 32.0,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.arrow_downward),
              iconSize: 32.0,
              onPressed: () {},
            ),
            Text(
              count.toString(),
              textScaleFactor: 1.5,
            )
          ],
        ),
        title: Text(
          title,
          textScaleFactor: 1.5,
          textAlign: TextAlign.left,
        ),
      ),
      footer: Container(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {},
          child: Text('Edit'),
        ),
      ),
    );
  }
}
