
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';


class HelpCenterScreen extends StatefulWidget {


  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Help",
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
              selectIcon: Icons.live_help_rounded,
              settingText: "Help Center",
              firstSubtext: "Send a report mail",
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            AccountInfoWidget(
              selectIcon: Icons.report_problem_rounded,
              settingText: "Report a bug",
              firstSubtext: "Report Mail",
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
