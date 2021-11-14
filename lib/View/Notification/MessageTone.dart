import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/SingleSelectionComponent.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';

class MessageTone extends StatefulWidget {

  @override
  _MessageToneState createState() => _MessageToneState();
}

class _MessageToneState extends State<MessageTone> {
  List<String> sortFilter = [
    'Early bed',
    "Song writer",
    "Come to Jesus",
    "Agony",
    "Sacrifice",
    'Sankofa',
    "Manifestivity",
    "Panache",
    "Spain",
    "Jazzy",
    "Frets",
    "Joyful",
    "Faith",
    "Abrupt",
    "Above",
    "Response",
    "Heavens"
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
              padding: const EdgeInsets.only(left: 10.0, right: 10,top: 7),
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
