import 'package:flutter/cupertino.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier{

  bool _darkTheme  = false ;
  DarkThemePref darkThemePref = DarkThemePref() ;
  bool get getDarkTheme => _darkTheme ;

  set setDarkTheme (bool value){
    _darkTheme = value ;
    darkThemePref.setDarkTheme(value);

    notifyListeners() ;
  }


}