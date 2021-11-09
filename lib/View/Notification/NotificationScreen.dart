
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';


class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 23,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            AccountInfoWidget(
              selectIcon: Icons.library_music_rounded,
              settingText: "Message tone",
              firstSubtext: "default (Love across)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.music_note,
              settingText: "Conversation tone",
              firstSubtext: "default(20)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.queue_music,
              settingText: "Call Ring Tone",
              firstSubtext: "default(dancing zombie)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.vibration,
              settingText: "Vibration",
              firstSubtext: "(default(2ms)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),


          ],
        ),
      ),
    );
  }
}
