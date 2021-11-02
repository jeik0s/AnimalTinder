import 'dart:async';
import 'package:animaltinder/services/model/tinder_model.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';


// https://www.youtube.com/watch?v=UpKrhZ0Hppk

class AnimaltinderDatabase{
  static final AnimaltinderDatabase instance = AnimaltinderDatabase._init();

  static Database? _database;

    AnimaltinderDatabase._init();

    Future<Database> get database async{
      if(_database != null) return _database!;

      _database = await _initDB('animaltinder.db');
      return _database!;
    }

    Future<Database> _initDB(String filePath) async{
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      return await openDatabase(path, version: 1, onCreate: _createDb);
    }

    Future _createDb(Database db, int version) async{
      final idType = 'INTEGER PRIMARY KEY';
      final textType = 'TEXT NOT NULL';
      final numericType = 'INTEGER NOT NULL';

       await db.execute(''' 
       CREATE TABLE $tableTinder (
        ${TinderFields.id} $idType,
        ${TinderFields.name} $textType,
        ${TinderFields.age} $numericType,
        ${TinderFields.breed} $textType,
        ${TinderFields.description} $textType,
        ${TinderFields.photoLink} $textType,
       )
       ''');
    }

    Future close() async{
      final db = await instance.database;
      db.close();
    }
}