import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static addStringToCache({required String? key,required String? value})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('$key', '$value');
  }

  static Future<String?> getStringFromCache({required String? key})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString('$key');
  }

}