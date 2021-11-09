
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';
import 'package:whisper_badbadoo/View/AccountSetting/AccountSettingScreen.dart';
import 'package:whisper_badbadoo/View/ChatSetting/ChatSettingScreen.dart';
import 'package:whisper_badbadoo/View/HelpCenter/HelpCenterScreen.dart';
import 'package:whisper_badbadoo/View/Notification/NotificationScreen.dart';
import 'package:whisper_badbadoo/View/Profile/ProfileScreen.dart';


class SettingsScreen extends StatefulWidget {
  // var togglecall;
  // SettingsScreen({this.togglecall});
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // ThemeData _lightTheme = ThemeData(
  //   accentColor: Colors.pink,
  //   brightness: Brightness.light,
  //   primaryColor: Colors.blueAccent,
  // );
  //
  // ThemeData _darkTheme = ThemeData(
  //   accentColor: Colors.orange,
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.teal,
  // );
  // bool _light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 23,
            color: Colors.white,
          ),
        ),
        // actions: [
        //   Switch(
        //     activeColor: Colors.white,
        //       value: _light, onChanged: (state){
        //     setState(() {
        //       _light = state;
        //     });
        //
        //   })
        // ],
        title: Text(
          "Settings",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/man.jpg"),
                            radius: 30,
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        // Container(
                        //   child: Text(
                        //     "@",
                        //     style: TextStyle(fontSize: 18),
                        //   ),
                        // ),
                        Container(
                          child: Text("richiequain",
                              style: GoogleFonts.lato(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ));
                        },
                        icon: Icon(Icons.edit, size: 22, color: Colors.black38),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.black38,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountSettingScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: AccountInfoWidget(
                      selectIcon: Icons.person,
                      settingText: "My Account",
                      firstSubtext: "Password",
                      secondSubText: "Delete Account",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatSettingScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: AccountInfoWidget(
                      selectIcon: Icons.chat,
                      settingText: "Chats",
                      firstSubtext: "Wallpaper",
                      secondSubText: "Theme",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: AccountInfoWidget(
                      selectIcon: Icons.notifications,
                      settingText: "Notification",
                      firstSubtext: "Call",
                      secondSubText: "Message alert",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                AccountInfoWidget(
                  selectIcon: Icons.account_balance_wallet_rounded,
                  settingText: "Payment",
                  firstSubtext: "Transactions",
                  secondSubText: "Voucher",
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                AccountInfoWidget(
                  selectIcon: Icons.privacy_tip_rounded,
                  settingText: "Privacy settings",
                  firstSubtext: "Hide Chat",
                  secondSubText: "Password",
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelpCenterScreen()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: AccountInfoWidget(
                      selectIcon: Icons.help,
                      settingText: "Help",
                      firstSubtext: "Help Centre",
                      secondSubText: "Report a bug",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),
                AccountInfoWidget(
                  selectIcon: Icons.more,
                  settingText: "Others",
                  firstSubtext: "Prank flags",
                  secondSubText: "Storage",
                ),
                Divider(
                  color: Colors.black38,
                  endIndent: 20,
                  indent: 20,
                ),

                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) => AccountSettingScreen(),
                //     //   ),
                //     // );
                //   },
                //   child: MoreCardScreenComponent(
                //     label: 'My Account',
                //     icon: Icons.person_outline_outlined,
                //     color: Colors.blue,
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: MoreCardScreenComponent(
                //       label: 'Notification',
                //       icon: Icons.notifications_none_outlined,
                //       color: Colors.pinkAccent),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => SettingScreen(),
                //     //     ));
                //   },
                //   child: MoreCardScreenComponent(
                //       label: 'Chats', icon: Icons.chat, color: Colors.orange),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => SettingScreen(),
                //     //     ));
                //   },
                //   child: MoreCardScreenComponent(
                //       label: 'Payment',
                //       icon: Icons.payment_outlined,
                //       color: Colors.deepPurple),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => SettingScreen(),
                //     //     ));
                //   },
                //   child: MoreCardScreenComponent(
                //       label: 'Privacy features',
                //       icon: Icons.privacy_tip_outlined,
                //       color: Colors.redAccent),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => SettingScreen(),
                //     //     ));
                //   },
                //   child: MoreCardScreenComponent(
                //       label: 'Help',
                //       icon: Icons.error_outline,
                //       color: Colors.teal),
                // ),
                // Column(
                //   children: [
                //     Expanded(
                //       child: Align(
                //         alignment: FractionalOffset.bottomCenter,
                //         child: Container(
                //           child: Text(
                //             'Version 1.1.0',
                //             style: GoogleFonts.lato(
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.blueAccent),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
