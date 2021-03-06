import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountSettings.dart';
import 'package:whisper_badbadoo/View/AccountSetting/ChangePassword.dart';
import 'package:whisper_badbadoo/View/AccountSetting/FingerprintSetting.dart';
import 'package:whisper_badbadoo/View/AccountSetting/ResetFingerPrintScreen.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Account",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 23,
            // color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: AccountSettings(
                    selectIcon: Icons.lock,
                    settingText: "Change Pin",
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
                        builder: (context) => FingerprintSetting()),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: AccountSettings(
                    selectIcon: Icons.fingerprint_outlined,
                    settingText: "Add fingerprint",
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
                        builder: (context) => ResetFingerPrintScreen(),
                      ));
                },
                child: Container(
                  color: Colors.transparent,
                  child: AccountSettings(
                    selectIcon: Icons.find_replace,
                    settingText: "Reset fingerprint",
                  ),
                ),
              ),
              Divider(
                color: Colors.black38,
                endIndent: 20,
                indent: 20,
              ),
              // AccountSettings(
              //   selectIcon: Icons.vpn_key_sharp,
              //   settingText: "Set pin",
              // ),
              // Divider(
              //   color: Colors.black38,
              //   endIndent: 20,
              //   indent: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
