import 'package:flutter/material.dart';
import 'package:grocery_app/bottom_navigation_bar.dart';
import 'package:grocery_app/home_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';
import 'consts/theme_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme()async{
    darkThemeProvider.setDarkTheme = (await darkThemeProvider.darkThemePref.getDarkTheme())! ;
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isDark = true ;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return darkThemeProvider ;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context , themeProvider , child){

          return MaterialApp(

            debugShowCheckedModeBanner: false,

            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme , context) ,
            home:  BottomNavigationBarScreen(),


          );
        }
      ),
    );
  }
}
