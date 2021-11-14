import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/AccountInfoWidget.dart';
import 'package:whisper_badbadoo/View/HelpCenter/HelpCenterScreen.dart';

import 'FlaggedPrankScreen.dart';

class OthersScreen extends StatefulWidget {

  @override
  _OthersScreenState createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
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
          "Others",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        // actions: [
        //   TextButton(
        //       onPressed: () {},
        //       child: Text(
        //         "Done",
        //         style: GoogleFonts.lato(
        //             fontSize: 19,
        //             color: Colors.white,
        //             fontWeight: FontWeight.w600),
        //       )),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlaggedPrankScreen()));
              },
              child: Container(
                height: 58,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.flag,
                            size: 27.5,
                            color: Colors.blueAccent,
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Text("Flagged Pranks",  style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          // color: Colors.black,
                        ),),
                      ),
                    ],
                  ),
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
                        builder: (context) => HelpCenterScreen()));
              },
              child: Container(
                height: 58,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.storage_rounded,
                            size: 27.5,
                            color: Colors.blueAccent,
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Text("Storage",  style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          // color: Colors.black,
                        ),),
                      ),
                    ],
                  ),
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
