import 'package:flutter/material.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';
import 'package:whisper_badbadoo/storage/UserDB.dart';

class UserDBImplementation {
  final BuildContext context;
  UserDBImplementation({this.context});

  UserDB userDB = UserDB();

  Future<void> initializeDB() async {
    try {
      await userDB.initialize();
    } catch (e) {
      print('initializeDB error: $e');
    }
  }

  Future<bool> saveUser(UserProfileModel model) async {
    try {
      await initializeDB();
      await userDB.deleteAll();
      return userDB.insertObject(model);
    } catch (e) {
      print('saveUser error: $e');
      return false;
    }
  }

  Future<UserProfileModel> getByProfileName(String profileName) async {
    try {
      await initializeDB();
      return userDB.getUserByProfile(profileName);
    } catch (e) {
      print('getByProfileName error: $e');
      return null;
    }
  }

  Future<UserProfileModel> getByLoginPin(String loginPin) async {
    try {
      await initializeDB();
      return userDB.getUserByLoginPin(loginPin);
    } catch (e) {
      print('getByLoginPin error: $e');
      return null;
    }
  }

  Future<UserProfileModel> getUser() async {
    try {
      await initializeDB();
      List<UserProfileModel> users = await userDB.getAllUsers();
      if(users.isNotEmpty) {
        return users.first;
      }
    } catch (e) {
      print('getUser error: $e');
      return null;
    }
    return null;
  }
}
