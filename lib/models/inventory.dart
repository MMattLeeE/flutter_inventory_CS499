//decorator for requiring fields in constructor
import 'package:flutter/foundation.dart';

//basic class that represents an inventory item
class Inventory {
  final String id;
  final String title;
  final String description;
  final int count;
  final String imageUrl;
  bool isFavorite; //changeable tied to a button the user clicks

  //constructor to instantiate
  Inventory({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.count,
    @required this.imageUrl,
    this.isFavorite = false,
  });
}
