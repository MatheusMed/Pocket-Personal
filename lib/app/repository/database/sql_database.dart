import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlDatabase {
  SqlDatabase._();

  static final SqlDatabase instace = SqlDatabase._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'pessoa.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(""" 
        CREATE TABLE pessoa(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          altura TEXT,
          peso TEXT
        );
      """);
  }
}