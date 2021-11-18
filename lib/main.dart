import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whisper_badbadoo/View/LandingScreen/LandingScreen.dart';
import 'package:whisper_badbadoo/View/Login/LoginScreen.dart';

import 'View/Registration/RegistrationScreen.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatefulWidget {
  // int thememode = 1;
  //
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // super.initState();
  // }
  // starting()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if(pref.getInt("thememode")!=null ){
  //     thememode = pref.getInt("thememode");
  //   }else{
  //     pref.setInt("thememode", thememode );
  //   }
  //   // setState(() {
  //   //
  //   // });
  //
  // }
  // toggletheme()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if(pref.getInt("thememode")==1 ){
  //     pref.setInt("thememode", 0 );
  //     thememode = 0;
  //   }else{
  //     pref.setInt("thememode", 1 );
  //     thememode = 1;
  //   }
  //   // setState(() {
  //   //
  //   // });
  // }

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  int thememode = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  starting() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("thememode") != null) {
      thememode = pref.getInt("thememode");
    } else {
      pref.setInt("thememode", thememode);
    }
    setState(() {});
  }

  toggletheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("thememode") == 1) {
      pref.setInt("thememode", 0);
      thememode = 0;
    } else {
      pref.setInt("thememode", 1);
      thememode = 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          cardColor: Colors.lightBlueAccent,
          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.black,
              ))
          // inputDecorationTheme: InputDecorationTheme(
          //   labelStyle: TextStyle(
          //     color: Colors.black
          //   ),
          // ),

          ),
      darkTheme: ThemeData.dark().copyWith(
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          // hintStyle: TextStyle(color: Colors.white)
        ),
        // hintColor: Colors.black,
        brightness: Brightness.dark,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        primaryColor: Colors.black45,
        accentColor: Colors.black,
        cardColor: Colors.black,
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Colors.white,
        // ),
        textTheme: TextTheme(
            // title: TextStyle(color: Colors.white),
            ),
      ),
      themeMode: thememode == 1 ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
