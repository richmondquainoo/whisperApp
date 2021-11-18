import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/ListTileMenuComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';

class LandingScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Material(
          color: Colors.blueAccent,
          child:  Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  children: <Widget>[
                    DrawerHeader(
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/images/man.jpg'),
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
                                  "Username",
                                  style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                // Text(
                                //   username!= null ? username : "Loading...",
                                //   style: GoogleFonts.lato(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Colors.white),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTileMenuComponent(
                      icon: Icons.local_fire_department_outlined,
                      label: 'Fire',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.bus_alert,
                      label: 'Sos',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.event_note,
                      label: 'Events',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.medical_services_rounded,
                      label: 'Medical',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.chat,
                      label: 'Chat',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.notifications,
                      label: 'Notification',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.help_center_rounded,
                      label: 'Help & Support',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.info,
                      label: 'About',
                      onTap: () {
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {
                      },
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
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () => _scaffoldKey.currentState.openDrawer(),
                            icon: Icon(Icons.menu_rounded, color:Colors.blueAccent, size: 28,),
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/images/man.jpg"),
                            radius: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/flame.png"),
                      ),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white12,

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
}
