import 'dart:convert';

import 'package:match_me/src/features/authentication/domain/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUserAccountLocal {
  static const userAccountKey = 'userAccountKey';

  static getDataUserAccountFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(userAccountKey) ?? '';
    return jsonDecode(result);
  }

  static void setDataUserAccountToStorage(UserAccount userAccount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userAccountKey, jsonEncode(userAccount.toMap()));
  }
}

class UserAccountRegister {
  static const userAccountRegisterKey = 'userAccountRegisterKey';

  static Future<bool> getUserAccountRegisterFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(userAccountRegisterKey);
    return result ?? false;
  }

  static void setUserAccountRegisterToStorage(bool isRegister) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userAccountRegisterKey, isRegister);
  }

  static void clearUserAccountRegister() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userAccountRegisterKey);
  }
}
