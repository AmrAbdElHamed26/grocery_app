import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePref {

  static const THEME_STATUS = 'THEMESTATUS';


  setDarkTheme(bool value )async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value) ;
  }

  Future<bool?>getDarkTheme ()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS);

  }




}