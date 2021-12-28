import 'dart:async';

import 'package:flutterpraticletest/SqliteDatabase/model.dart';
import 'package:flutterpraticletest/SqliteDatabase/usernameItem.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'example';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static Future<int> delete(String table) async => await _db.delete(table);

  static void onCreate(Database db, int version) async =>
      await db.execute('CREATE TABLE user_name (username STRING)');


  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());
  static Future<void> insertUserName(String text) async {
    UserNameItem item;
    item = UserNameItem(
      username: text,
    );
    if (item != null) await DB.insert(UserNameItem.table, item);
  }
}
