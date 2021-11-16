import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';

class ReportBugScreen extends StatefulWidget {

  @override
  _ReportBugScreenState createState() => _ReportBugScreenState();
}

class _ReportBugScreenState extends State<ReportBugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Report Bug",
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
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  child:  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter your message',
                    ),
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 50,
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: TextButtonComponent(
                borderRadius: 9,
                labelColor: Colors.blueAccent,
                label: 'Submit',
                onTap: () {
                  new UtilityService().confirmationBox(
                      color: Colors.blueAccent,
                      context: context,
                      title: 'Submission',
                      message:
                      'Want to proceed with submission?',
                      onNo: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      onYes: () {
                        // Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                  );
                }),
          ),

        ],
      ),
    );
  }
}
