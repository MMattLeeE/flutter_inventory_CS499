import 'package:flutter/material.dart';

//bring in the screen class to use in the main file
import './screens/inventory_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: InventoryOverviewScreen(),
    );
  }
}
