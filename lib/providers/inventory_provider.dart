import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './inventory.dart';

class InventoryProvider with ChangeNotifier {
  final String authToken;
  final String userId;
  List<Inventory> _items = [];
  List<Inventory> _baseItems = [];
  //to not lose the previously loaded items list, pass it into constructor
  //so on rebuilds it gets retained. Seen in proxy provider in main.dart
  InventoryProvider(this.authToken, this.userId, this._items, this._baseItems);

  List<Inventory> get items {
    return [..._items];
  }

  List<Inventory> get baseItems {
    return [..._baseItems];
  }

  Inventory findById(String id) {
    return _items.firstWhere((inventory) => inventory.id == id);
  }

  Future<void> refreshInventory() async {
    final url =
        'https://inventory-171de.firebaseio.com/inventory.json?auth=$authToken&orderBy="ownerId"&equalTo="$userId"';
    try {
      final response = await http.get(url);

      final invList = json.decode(response.body) as Map<String, dynamic>;

      final List<Inventory> loadedInv = [];
      invList.forEach((invId, invData) {
        loadedInv.add(
          Inventory(
            id: invId,
            title: invData["title"],
            count: invData["count"],
            description: invData["description"],
          ),
        );
      });

      _items = loadedInv;
      _baseItems = loadedInv;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addInventory(Inventory inventory) async {
    // firebase will build a collection for you based on the
    //  url endpoint in the request. Must send JSON.
    final url =
        'https://inventory-171de.firebaseio.com/inventory.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'ownerId': userId,
          'title': inventory.title,
          'count': inventory.count,
          'description': inventory.description,
        }),
      );
      final newInventory = Inventory(
        id: json.decode(response.body)['name'],
        title: inventory.title,
        count: inventory.count,
        description: inventory.description,
      );
      _items.insert(0, newInventory);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateInventory(String id, Inventory newInventory) async {
    final inventoryIndex = _items.indexWhere((inventory) => inventory.id == id);
    final url =
        'https://inventory-171de.firebaseio.com/inventory/$id.json?auth=$authToken';
    await http.patch(url,
        body: json.encode({
          'title': newInventory.title,
          'count': newInventory.count,
          'description': newInventory.description,
        }));
    _items[inventoryIndex] = newInventory;
    notifyListeners();
  }

  void deleteInventory(String id) {
    final url =
        'https://inventory-171de.firebaseio.com/inventory/$id.json?auth=$authToken';
    http.delete(url);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void searchInventory(String searchText) {
    //save original item list
    print("runnning search function");
    if (searchText.isEmpty) {
      _items = _baseItems;
    }
    if (searchText.isNotEmpty) {
      List<Inventory> tempList = [];
      _items.forEach((element) {
        if (element.title.toLowerCase().contains(searchText.toLowerCase())) {
          tempList.add(element);
        }
      });
      _items = tempList;
    }
    notifyListeners();
  }
}
