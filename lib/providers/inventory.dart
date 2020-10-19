//decorator for requiring fields in constructor
import 'package:flutter/foundation.dart';

//basic class that represents an inventory item
class Inventory with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  int count;
  bool isFavorite; //changeable tied to a button the user clicks

  //constructor to instantiate
  Inventory({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.count,
    this.isFavorite = false,
  });

  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }
}
