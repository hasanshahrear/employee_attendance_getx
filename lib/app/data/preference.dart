import 'package:get_storage/get_storage.dart';

class Preference {
  // initializing
  static final prefs = GetStorage();

  // keys
  static const loggedInFlag = 'loginFlag';
  static const rememberMeFlag = 'rememberMeFlag';
  static const loginPhone = 'loginPhone';
  static const loginPass = 'loginPass';

  static bool getLoggedInFlag() => prefs.read(loggedInFlag) ?? false;

  static void setLoggedInFlag(bool value) => prefs.write(loggedInFlag, value);

  static bool getRememberMeFlag() => prefs.read(rememberMeFlag) ?? false;

  static void setRememberMeFlag(bool value) =>
      prefs.write(rememberMeFlag, value);

  static String getLoginPhone() => prefs.read(loginPhone) ?? '';

  static void setLoginPhone(String value) => prefs.write(loginPhone, value);

  static String getLoginPass() => prefs.read(loginPass) ?? '';

  static void setLoginPass(String value) => prefs.write(loginPass, value);

  static void logout() => prefs.remove(loggedInFlag);

  static void clearAll() => prefs.erase();
}
