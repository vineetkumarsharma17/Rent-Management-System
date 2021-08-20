import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class userName{
  String name;
  String mobile;
  String user_name;
  String password;
  userName({
   this.name,
    this.mobile,
    this.user_name,
    this.password
});
  Map<String,dynamic>toMap(){
return{
  'name':name,
  'mobile':mobile,
  'user_name':user_name,
  'password':password,
};
  }
}
class DatabaseHelper{
  static final _databaseName="rent.db";
  static final _databaseVersion=1;
  static final table="user_pass";
  static final nameColumn='name';
  static final mobileColumn="mobile";
  static final user_nameColumn="user_name";
  static final passwordColumn="password";
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    print("\nDatabase created");
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate:_onCreate );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $user_nameColumn TEXT PRIMARY KEY,
            $passwordColumn TEXT NOT NULL,
            $nameColumn TEXT NOT NULL,
            $mobileColumn TEXT NOT NULL
          );
          ''');
  }
  Future<int> insertUser(userName obj) async {
    // Get a reference to the database.
    final db = await database;
    return   await db.insert(
      table,
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<int> deleteUser(String user_name) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$user_nameColumn = ?', whereArgs: [user_name]);
    print("Deleted");
  }
  Future<List<userName>> vieweAllUsers() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return userName(
          name: maps[i][nameColumn],
          mobile: maps[i][mobileColumn],
          user_name: maps[i][user_nameColumn],
          password: maps[i][passwordColumn],
      );
    });
  }

}