import 'dart:io';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/model/personmodel/personmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'my_database.db';
  static final _databaseVersion = 1;

  static final tablePerson = 'person';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';
  static final columnIsMarried = 'isMarried';
  static final columnJob = 'job';
  static final columnPlace = 'place';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tablePerson (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL,
            $columnIsMarried INTEGER NOT NULL,
            $columnJob TEXT NOT NULL,
            $columnPlace TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertPerson(Person person) async {
    Database? db = await instance.database;
    log(db!.isOpen.toString());
    try {
      int newid;
      newid = await db
          .insert(tablePerson, person.toMap())
          .then((value) => newid = value);

      person.id = newid;
      log(newid.toString());
    } catch (e) {
      log(e.toString());
    }

    log('hi..........S');

    log(person.id.toString());
    return await db.insert(tablePerson, person.toMap());
  }

  Future<int> updatePerson(Person person) async {
    Database? db = await instance.database;
    return await db!.update(tablePerson, person.toMap(),
        where: '$columnId = ?', whereArgs: [person.id]);
  }

  Future<Person?> getPerson() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(tablePerson, limit: 1);
    if (maps.isEmpty) {
      return null;
    } else {
      return Person.fromMap(maps.first);
    }
  }

  Future<void> deletePerson() async {
    Database? db = await instance.database;
    await db!.delete(tablePerson);
  }
}
