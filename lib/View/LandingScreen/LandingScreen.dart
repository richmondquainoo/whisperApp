import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whisper_badbadoo/Component/ListTileMenuComponent.dart';
import 'package:whisper_badbadoo/View/LandingScreen/EventScreen.dart';
import 'package:whisper_badbadoo/View/LandingScreen/FireScreen.dart';
import 'package:whisper_badbadoo/View/LandingScreen/MedicalScreen.dart';
import 'package:whisper_badbadoo/View/LandingScreen/SosScreen.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';
import 'package:whisper_badbadoo/storage/UserDB.dart';
import 'package:whisper_badbadoo/storage/UserDBImp.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserDBImplementation dbImplementation = UserDBImplementation();
  UserDB userDB = UserDB();
  UserProfileModel user;
  String base64Encoded;
  File imageFile;
  @override
  void initState() {
    super.initState();
    initializeDB();
  }

  void initializeDB() async {
    try {
      await userDB.initialize();
      getUserInfo();
    } catch (e) {
      print('init err: $e');
    }
  }

  void getUserInfo() async {
    UserProfileModel u = await dbImplementation.getUser();
    setState(() {
      user = u;
    });
    setProfilePicture();
  }

  void setProfilePicture() async {
    try {
      if (user.picture != null) {
        base64Encoded = user.picture;
        final decodedBytes = base64Decode(base64Encoded);
        final directory = await getApplicationDocumentsDirectory();
        var file = File("${directory.path}/profile.png");
        file.writeAsBytesSync(decodedBytes);
        imageFile = file;
      }
    } catch (e) {
      print('setProfilePicture err: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Material(
          color: Colors.black12,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blueAccent,
                            Colors.black12,
                          ],
                        ),
                      ),
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: displayProfilePicture(),
                              radius: 25,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (user != null && user.profileName != null)
                                      ? user.profileName
                                      : "user",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTileMenuComponent(
                      icon: Icons.local_fire_department_outlined,
                      label: 'Fire',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.bus_alert,
                      label: 'Sos',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.event_note,
                      label: 'Events',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.medical_services_rounded,
                      label: 'Medical',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.chat,
                      label: 'Chat',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.settings,
                      label: 'Settings',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()));
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.notifications,
                      label: 'Notification',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.help_center_rounded,
                      label: 'Help & Support',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.info,
                      label: 'About',
                      onTap: () {},
                    ),
                    ListTileMenuComponent(
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 12,
                    ),

                    // ListTileMenuComponent(
                    //   icon: Icons.format_paint_rounded,
                    //   label: 'Themes',
                    //   onTap: () {},
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      child: Column(
                        children: [
                          Divider(
                            thickness: 0.3,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                'Version 1.1.0',
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      child: CircleAvatar(
                        backgroundImage: displayProfilePicture(),
                        radius: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FireScreen(),
                            ));
                      },
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(160),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              child: Image(
                                image: AssetImage("assets/images/fire.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Fire",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MedicalScreen()),
                              );
                            },
                            child: Container(
                              height: 110,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(160),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/first-aid-kit.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Medical",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(300),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 120,
                                  child: Image(
                                    image: AssetImage("assets/images/chat.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  child: Text(
                                    "Chat",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SosScreen()),
                              );
                            },
                            child: Container(
                              height: 110,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(160),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/sos.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Sos",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventScreen()));
                      },
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(160),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              child: Image(
                                image: AssetImage("assets/images/alarm.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Event",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Object displayProfilePicture() {
    return imageFile != null
        ? FileImage(imageFile)
        : AssetImage('assets/images/no_user.jpg');
  }
}
