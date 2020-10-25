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
  var _isLoading = false;
  var _isInit = true;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<InventoryProvider>(context, listen: false)
          .refreshInventory()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Search..."),
                  onChanged: (String searchText) {
                    Provider.of<InventoryProvider>(context, listen: false)
                        .searchInventory(searchText);
                  },
                ),
                Expanded(
                  child: InventoryGrid(),
                ),
              ],
            ),
    );
  }
}
