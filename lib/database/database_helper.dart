import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databse_name = "user_database";
  static const _database_version = 1;

  static const table_name = 'user_table';

  static const id = 'id';
  static const fname = 'first_name';
  static const lname = 'last_name';
  static const email = 'email';
  static const gender = 'gender';
  static const password = 'password';

  static Database? _database;

  DatabaseHelper._privateConstructor();

  static final instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databse_name);
    return await openDatabase(
        path, version: _database_version, onCreate: _createDatabase);
  }


  Future _createDatabase(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $table_name(
      $id INTEGER PRIMARY KEY,
      $fname TEXT NOT NULL, 
      $lname TEXT NOT NULL, 
      $email TEXT NOT NULL, 
      $gender TEXT NOT NULL, 
      $password TEXT NOT NULL 
    )
    ''');
  }


  // -----------------------------------
  // Queries
  // -----------------------------------
  // Future<int> insert(Map<String, dynamic> row) async{
  //   Database db = await instance.database;
  //   return await db.insert(table_name, row);
  // }

  Future<int> insertUser({
    required String firstName,
    required String lastName,
    required String email_,
    required String gender_,
    required String password_,
  }) async {
    Database db = await instance.database;
    final row = {
      fname: firstName,
      lname: lastName,
      email: email_,
      gender: gender_,
      password: password_,
    };
    return await db.insert(table_name, row);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await instance.database;
    return await db.query(table_name);
  }

  Future<void> readUsers() async {
    List<Map<String, dynamic>> users = await getUsers();
    for (var user in users) {
      debugPrint('User ID: ${user[id]}');
      debugPrint('First Name: ${user[fname]}');
      debugPrint('Last Name: ${user[lname]}');
      debugPrint('Email: ${user[email]}');
      debugPrint('Gender: ${user[gender]}');
      debugPrint('Password: ${user[password]}');
      debugPrint('-------------------');
    }
  }

}
