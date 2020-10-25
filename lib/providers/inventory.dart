//decorator for requiring fields in constructor
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//basic class that represents an inventory item
class Inventory with ChangeNotifier {
  final String id;
  final String title;
  int count;
  final String description;
  //final String imageUrl;
  //bool isFavorite; //changeable tied to a button the user clicks

  //constructor to instantiate
  Inventory({
    @required this.id,
    @required this.title,
    @required this.count,
    @required this.description,
    //@required this.imageUrl,
    //this.isFavorite = false,
  });

  Future<void> incrementCount(String authToken) async {
    print("increment count");
    count++;
    notifyListeners();
    final url =
        'https://inventory-171de.firebaseio.com/inventory/$id.json?auth=$authToken';
    await http.patch(
      url,
      body: json.encode({
        'count': count,
      }),
    );
  }

  Future<void> decrementCount(String authToken) async {
    if (count > 0) {
      count--;
      notifyListeners();
      final url =
          'https://inventory-171de.firebaseio.com/inventory/$id.json?auth=$authToken';
      await http.patch(
        url,
        body: json.encode({
          'count': count,
        }),
      );
    }
  }
}
