import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'ChatDeletionScreen.dart';
import 'ScreenLockScreen.dart';

class PrivacySettingScreen extends StatefulWidget {
  @override
  _PrivacySettingScreenState createState() => _PrivacySettingScreenState();
}

class _PrivacySettingScreenState extends State<PrivacySettingScreen> {
  bool firstValue = true;
  bool secondValue = true;
  bool thirdValue = true;
  bool fourthValue = true;
  bool fifthValue = true;

  bool toogleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // shadowColor: Colors.white,
        // backgroundColor: Colors.white,
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
        title: Text(
          "Privacy settings",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: GoogleFonts.lato(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Visible on your profile",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Username",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: firstValue,
                    onChanged: (value) =>
                        setState(() => this.firstValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Phone number",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: secondValue,
                    onChanged: (value) =>
                        setState(() => this.secondValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Profile picture",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: thirdValue,
                    onChanged: (value) =>
                        setState(() => this.thirdValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Online status",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: fourthValue,
                    onChanged: (value) =>
                        setState(() => this.fourthValue = value),
                  ),
                ),
              ],
            ),
          ),
          // Divider(
          //   thickness: 0.6,
          // ),
          Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Screen lock",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenLockScreen(),
                        ));
                  },
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "MESSAGES FROM UNKNOWN USERS",
                style: GoogleFonts.lato(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    wordSpacing: 4,
                    letterSpacing: 0.7),
              ),
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Mute messages",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: fifthValue,
                    onChanged: (value) =>
                        setState(() => this.fifthValue = value),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Chat Deletion",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDeletionScreen(),
                        ));
                  },
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
