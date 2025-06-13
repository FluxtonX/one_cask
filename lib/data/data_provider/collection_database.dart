import 'dart:async';
import 'package:one_cask/models/bottle.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CollectionDatabase {
  static final CollectionDatabase instance = CollectionDatabase._init();
  static Database? _database;

  CollectionDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('collection.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE bottles (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      year TEXT NOT NULL,
      cask TEXT NOT NULL,
      image TEXT NOT NULL,
      details TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertBottle(Bottle bottle) async {
    final db = await database;
    await db.insert('bottles', bottle.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Bottle>> getBottles() async {
    final db = await database;
    final maps = await db.query('bottles');
    return List.generate(maps.length, (i) {
      return Bottle.fromMap(maps[i]);
    });
  }

  Future close() async {
    final db = await database;
    _database = null;
    await db.close();
  }
}
