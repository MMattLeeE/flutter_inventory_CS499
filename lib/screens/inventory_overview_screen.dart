import 'package:app_2/screens/inventory_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/inventory_grid.dart';
import '../providers/inventory_provider.dart';

// this screen shows the main inventory list which is made up of
// InventoryGrid -> InventoryItem
class InventoryOverviewScreen extends StatefulWidget {
  @override
  _InventoryOverviewScreenState createState() =>
      _InventoryOverviewScreenState();
}

class _InventoryOverviewScreenState extends State<InventoryOverviewScreen> {
  // var _isInit = true;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<InventoryProvider>(context, listen: false).refreshInventory();
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (!_isInit) {
  //     Provider.of<InventoryProvider>(context).refreshInventory();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory List' +
            Provider.of<InventoryProvider>(context).items.length.toString()),
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
