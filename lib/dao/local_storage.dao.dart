import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences prefs;

  String name = " ";
  String email = " ";
  String password = " ";

  Future<void> createAccount(
      String nameCreate, String emailCreate, String passwordCreate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalStorage().name, nameCreate);
    await prefs.setString(LocalStorage().email, emailCreate);
    await prefs.setString(LocalStorage().password, passwordCreate);
  }
}
