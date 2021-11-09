
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';


class ChatSettingScreen extends StatefulWidget {

  @override
  _ChatSettingScreenState createState() => _ChatSettingScreenState();
}

class _ChatSettingScreenState extends State<ChatSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
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
              selectIcon: Icons.font_download,
              settingText: "Chat Fontstyle",
              firstSubtext: "default (Arial rounded MT bold)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.text_fields_outlined,
              settingText: "Chat Fontsize",
              firstSubtext: "default(20)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.chat_bubble_outlined,
              settingText: "Chat bubble background",
              firstSubtext: "default(grey)",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.invert_colors_sharp,
              settingText: "Chat bubble text color",
              firstSubtext: "(default(#3333)",
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
