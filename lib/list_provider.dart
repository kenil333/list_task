import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  // The 'listData' map is used to store the count for each id.
  Map<int, int> listData = {};

  // Method to increment the count for a specific 'id'.
  incrementListData(int id) {
    // If the 'id' exists in the map, increment its count, otherwise set it to 1.
    listData[id] = (listData[id] ?? 0) + 1;

    // Notify listeners to inform that the 'listData' has been updated.
    notifyListeners();
  }
}
