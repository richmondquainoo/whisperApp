import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/MyActionButton.dart';
import 'package:whisper_badbadoo/Component/SingleSelectionComponent.dart';

class ChatFontStyleScreen extends StatefulWidget {

  @override
  _ChatFontStyleScreenState createState() => _ChatFontStyleScreenState();
}

class _ChatFontStyleScreenState extends State<ChatFontStyleScreen> {
  List<String> sortFilter = [
    'Abadi MT Condensed Light',
    "Albertus Extra Bold",
    "Albertus Medium",
    "Antique Olive",
    "Arial",
    'Arial Black',
    "Book Antiqua",
    "Boulder",
    "Calisto MT",
    "Century Gothic",
    "CG Omega",
    "Chaucer",
    "Coronet",
    "Geneva",
    "Letter Gothic",
    "Lithograph",
    "Long Island",
    "Lucida Sans",
    "Marigold",
    "MS LineDraw",
    "Old Century",
    "Pegasus",
    "Pythagoras",
    "Sceptre",
    "Tahoma",
    "Teletype",
    "Times New Roman",
    "Trebuchet MS",
    "Unicorn",
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
            // color: Colors.blueAccent,
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
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
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
