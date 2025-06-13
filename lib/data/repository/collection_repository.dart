import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:one_cask/data/data_provider/collection_database.dart';
import 'package:one_cask/models/bottle.dart';

class CollectionRepository {
  final CollectionDatabase _database = CollectionDatabase.instance;

  Future<List<Bottle>> getCollection() async {
    final String response =
        await rootBundle.loadString('assets/data/collection.json');
    final List<dynamic> data = jsonDecode(response);
    final List<Bottle> bottles =
        data.map((json) => Bottle.fromJson(json)).toList();

    for (var bottle in bottles) {
      await _database.insertBottle(bottle);
    }

    return await _database.getBottles();
  }
}
