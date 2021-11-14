import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/SingleSelectionComponent.dart';

class ChatFontSizeScreen extends StatefulWidget {

  @override
  _ChatFontSizeScreenState createState() => _ChatFontSizeScreenState();
}

class _ChatFontSizeScreenState extends State<ChatFontSizeScreen> {
  List<String> sortFilter = [
    '1',
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 7),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(child: SingleSelectionExample(sortFilter)),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
