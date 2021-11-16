import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';
import 'package:whisper_badbadoo/View/HelpCenter/FAQsScreen.dart';
import 'package:whisper_badbadoo/View/HelpCenter/ReportBugScreen.dart';
import 'package:whisper_badbadoo/View/HelpCenter/TermsAndConditionScreen.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Help Center",
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
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsAndConditionScreen()));
              },
              child: Container(
                color: Colors.transparent,
                child: AccountInfoWidget(
                  selectIcon: Icons.policy_rounded,
                  settingText: "Terms and Conditions",
                  firstSubtext: "Policy",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FAQsScreen()));
              },
              child: Container(
                color: Colors.transparent,
                child: AccountInfoWidget(
                  selectIcon: Icons.announcement_rounded,
                  settingText: "FAQs",
                  firstSubtext: "Answers",
                ),
              ),
            ),
            Divider(
              color: Colors.black38,
              endIndent: 20,
              indent: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportBugScreen()));
              },
              child: Container(
                color: Colors.transparent,
                child: AccountInfoWidget(
                  selectIcon: Icons.report_problem_rounded,
                  settingText: "Report a bug",
                  firstSubtext: "Report Mail",
                ),
              ),
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
