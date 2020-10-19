import 'package:flutter/material.dart';

//importing the inventory.dart model class
import '../models/inventory.dart';
import '../widgets/inventory_item.dart';

class InventoryOverviewScreen extends StatelessWidget {
  final List<Inventory> loadedInventory = [
    Inventory(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      count: 29,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Inventory(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      count: 59,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Inventory(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      count: 19,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Inventory(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      count: 49,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory List'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedInventory.length,
        itemBuilder: (ctx, i) => InventoryItem(
          loadedInventory[i].id,
          loadedInventory[i].title,
          loadedInventory[i].imageUrl,
          loadedInventory[i].count,
        ), //define how every gridcell is built
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //number of columns
          childAspectRatio: 6 / 2,
          crossAxisSpacing: 10, //spacing between columns
          mainAxisSpacing: 10, //spacing between rows
        ),
      ),
    );
  }
}
