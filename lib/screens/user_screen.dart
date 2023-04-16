import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
   UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color color = themeState.getDarkTheme ? Colors.white : Colors.black ;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: 'Hi,  ',
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'MyName',
                      style: TextStyle(
                        color:color,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('My name is pressed');
                        }),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('Email@email.com',style:
            TextStyle(color: color,
              fontSize: 18,
            ),),

            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            _listTiles(
              title: 'Address',
              subTitle: 'subtitle',
              leadingIcon: Icon(Icons.person_outlined),
              onPressed: (){},

            ),
            _listTiles(
              title: 'Orders',
              leadingIcon: Icon(Icons.shopping_bag),
              onPressed: (){},
            ),
            _listTiles(
              title: 'WishList ',
              leadingIcon: Icon(IconlyLight.heart),
              onPressed: (){},
            ),
            _listTiles(
              title: 'Forget Password ',
              leadingIcon: Icon(IconlyLight.unlock),
              onPressed: (){},
            ),
            _listTiles(
              title: 'Viewed Items ',
              leadingIcon: Icon(IconlyLight.show),
              onPressed: (){},
            ),
            SwitchListTile(
              value: themeState.getDarkTheme,
              title: Text('Theme' , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w400),),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                themeState.setDarkTheme = value ;
              },
            ),
            _listTiles(
              title: 'Logout ',
              leadingIcon: Icon(IconlyLight.logout),
              onPressed: (){},
            ),
          ],
        ),
      ),

    );
  }
}

class _listTiles extends StatelessWidget {
   _listTiles({
    super.key,
    required this.title ,
      this.subTitle ,
     required this.leadingIcon,
     required this.onPressed ,

  });

  String title ;
  String ? subTitle;
  Icon leadingIcon ;
  Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ,
        style: TextStyle(
          fontWeight: FontWeight.w400 ,
          fontSize: 24 ,
        ),
      ),
      subtitle: Text(
        subTitle == null ? "" : subTitle!

      ) ,
      leading: leadingIcon,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: (){
        onPressed();
      },
    );
  }
}
