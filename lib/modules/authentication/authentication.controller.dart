import 'package:av3/dao/local_storage.dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController {

  late SharedPreferences prefs;

  String reg =
      (r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  
  bool verfiryLogin(String email, String password) {
    bool status = false;
    bool emailValid = RegExp(reg).hasMatch(email);

    if (email.isNotEmpty && emailValid && password.isNotEmpty) {
      if (email == prefs.getString(LocalStorage().email) &&
          password == prefs.getString(LocalStorage().password)) {
        status = true;
      }
    }
    return status;
  }

  bool verifyEmail(String email) {
    bool status = false;
    bool createEmail = RegExp(reg).hasMatch(email);
    if (email.isNotEmpty && createEmail) {
      status = true;
    }
    return status;
  }

  bool verifyPassowrd(String password) {
    bool status = false;
    if (password.isNotEmpty && password.length >= 8) {
      status = true;
    }
    return status;
  }
}
