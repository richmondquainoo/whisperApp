import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';

class UserDB {
  var database;

  Future<void> initialize() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'whisper-app-user-db.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE Table obj("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "picture TEXT, "
          "profileName TEXT, "
          "name TEXT, "
          "fingerPrint TEXT, "
          "loginPin TEXT, "
          "phone TEXT, "
          "email TEXT "
          ")",
        );
      },
      version: 1,
    );
  }

  Future<bool> insertObject(UserProfileModel model) async {
    try {
      final Database db = await database; // Get a reference to the database.
      print('Database(UserProfileModel): $db');
      await db.insert(
        'obj',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Insertion Error(UserProfileModel): $e');
      return false;
    }
    return true;
  }

  Future<List<UserProfileModel>> getAllUsers() async {
    try {
      final Database db = await database;

      // Query the obj for all The Objects.
      final List<Map<String, dynamic>> maps = await db.query('obj');
      print('List of items from getAllUsers query: ${maps.length}');

      return List.generate(
        maps.length,
        (i) {
          return UserProfileModel(
            id: maps[i]['id'],
            picture: maps[i]['picture'],
            profileName: maps[i]['profileName'],
            name: maps[i]['name'],
            fingerPrint: maps[i]['fingerPrint'],
            loginPin: maps[i]['loginPin'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
          );
        },
      );
    } catch (e) {
      print('Fetch Error(getAllUsers): $e');
      return null;
    }
  }

  Future<UserProfileModel> authenticateUser(
      String profileName, loginPin) async {
    try {
      final Database db = await database;

      // Query the obj
      final List<Map<String, dynamic>> maps = await db.rawQuery(
          'select * from obj where profileName=\'$profileName\' and loginPin=\'$loginPin\'');
      return List.generate(
        maps.length,
        (i) {
          return UserProfileModel(
            id: maps[i]['id'],
            picture: maps[i]['picture'],
            profileName: maps[i]['profileName'],
            name: maps[i]['name'],
            fingerPrint: maps[i]['fingerPrint'],
            loginPin: maps[i]['loginPin'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
          );
        },
      ).first;
    } catch (e) {
      print('Fetch Error(getAllUsers): $e');
      return null;
    }
  }

  Future<UserProfileModel> getUserByEmail(String email) async {
    try {
      final Database db = await database;

      // Query the obj
      final List<Map<String, dynamic>> maps =
          await db.rawQuery('select * from obj where email=\'$email\' ');
      return List.generate(
        maps.length,
        (i) {
          return UserProfileModel(
            id: maps[i]['id'],
            picture: maps[i]['picture'],
            profileName: maps[i]['profileName'],
            name: maps[i]['name'],
            fingerPrint: maps[i]['fingerPrint'],
            loginPin: maps[i]['loginPin'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
          );
        },
      ).first;
    } catch (e) {
      print('Fetch Error(getUserByEmail): $e');
      return null;
    }
  }

  Future<UserProfileModel> getUserByProfile(String profileName) async {
    try {
      final Database db = await database;

      // Query the obj
      final List<Map<String, dynamic>> maps = await db
          .rawQuery('select * from obj where profileName=\'$profileName\' ');
      return List.generate(
        maps.length,
        (i) {
          return UserProfileModel(
            id: maps[i]['id'],
            picture: maps[i]['picture'],
            profileName: maps[i]['profileName'],
            name: maps[i]['name'],
            fingerPrint: maps[i]['fingerPrint'],
            loginPin: maps[i]['loginPin'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
          );
        },
      ).first;
    } catch (e) {
      print('Fetch Error(getUserByEmail): $e');
      return null;
    }
  }

  Future<bool> updateObject(UserProfileModel model) async {
    try {
      final db = await database;
      await db.update(
        'obj',
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (e) {
      print('Update error(UserProfileModel): $e');
      return false;
    }
    return true;
  }

  Future<void> deleteByProfileName(String profileName) async {
    final db = await database;
    // Remove Object from the database.
    await db.delete(
      'obj',
      where: "profileName = ?",
      whereArgs: [profileName],
    );
  }

  Future<void> deleteObject(int id) async {
    final db = await database;
    // Remove Object from the database.
    await db.delete(
      'obj',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final db = await database;
    // Remove Object from the database.
    await db.delete(
      'obj',
    );
  }
}
