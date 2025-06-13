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

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE bottles (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      year TEXT NOT NULL,
      cask TEXT NOT NULL,
      image TEXT NOT NULL,
      details TEXT NOT NULL,
      distillery TEXT,
      region TEXT,
      country TEXT,
      type TEXT,
      ageStatement TEXT,
      filled TEXT,
      bottled TEXT,
      caskNumber TEXT,
      abv TEXT,
      size TEXT,
      finish TEXT,
      history TEXT
    )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE bottles ADD COLUMN distillery TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN region TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN country TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN type TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN ageStatement TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN filled TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN bottled TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN caskNumber TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN abv TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN size TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN finish TEXT');
      await db.execute('ALTER TABLE bottles ADD COLUMN history TEXT');
    }
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
