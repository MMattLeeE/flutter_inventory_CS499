import 'package:app_2/screens/inventory_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//bring in the screen class to use in the main file
import './screens/inventory_overview_screen.dart';
import './screens/inventory_edit_screen.dart';
import './screens/inventory_add_screen.dart';
//bring in for the provider to be registered at the highest level of widget tree
import './providers/inventory_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //wrapping the widget with a change notifier
    return ChangeNotifierProvider(
      // return a inventory provider instance
      create: (ctx) => InventoryProvider(),
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.blue,
        ),
        home: InventoryOverviewScreen(),
        routes: {
          // /inventory_edit
          InventoryEditScreen.routeName: (ctx) => InventoryEditScreen(),
          InventoryAddScreen.routeName: (ctx) => InventoryAddScreen(),
        },
      ),
    );
  }
}
