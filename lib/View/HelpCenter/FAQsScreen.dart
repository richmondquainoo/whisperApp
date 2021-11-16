import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FAQs",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "What is Whisper?",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "How secure is the app when it comes to my privacy?",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "How do I make purchases with Mobile money?",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "What are the advantages of using this app?",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "How can I  trigger an alert on the app?",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Are there any sanctions when a false alarm is triggered?",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        new UtilityService().messageContent(
                            context: context,
                            message: "A  social media app with a  high level of security and privacy."
                                "Whisper allows you to send alert signals to people in your "
                                "neighbourhood when you are in distress."
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6,),
            ],
          ),
        ),
      ),
    );
  }
}
