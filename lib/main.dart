import 'package:app_2/screens/inventory_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//bring in the screen class to use in the main file
import './screens/inventory_overview_screen.dart';
import './screens/inventory_edit_screen.dart';
import './screens/inventory_add_screen.dart';
//bring in for the provider to be registered at the highest level of widget tree
import './providers/inventory_provider.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //wrapping the widget with a change notifier
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider(
          // return a inventory provider instance
          create: (ctx) => InventoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Inventory App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.blue,
        ),
        home: AuthScreen(),
        routes: {
          // /inventory_edit
          InventoryEditScreen.routeName: (ctx) => InventoryEditScreen(),
          InventoryAddScreen.routeName: (ctx) => InventoryAddScreen(),
        },
      ),
    );
  }
}
