import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/constants/MyColors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FlaggedPrankScreen extends StatefulWidget {
  @override
  _FlaggedPrankScreenState createState() => _FlaggedPrankScreenState();
}

class _FlaggedPrankScreenState extends State<FlaggedPrankScreen> {

  bool value = true;
  bool firstValue = true;
  bool secondValue = true;

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
          "Flagged Pranks",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "When a user is flagged five times as prank,"
                    " the toggle be turned on automatically "
                    "and the user will be blocked.",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1.6,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.arrow_right_outlined,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      "Toggle to unblock a blocked user",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 0.6,
                  //     spreadRadius: 1.5,
                  //     color: Colors.black12,
                  //     offset: Offset(0.2, 1),
                  //   ),
                  // ],
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage:
                                  AssetImage('assets/images/no_user.jpg'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "ID: ",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "22421211413",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              new LinearPercentIndicator(
                                width: 150.0,
                                lineHeight: 20.0,
                                percent: 0.1,
                                progressColor: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Switch.adaptive(
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.red,
                              value: value,
                              onChanged: (value) => setState(() => this.value = value),
                            ),
                          ),
                          Container(
                            child: Text("1/5", style: TextStyle(color: Colors.white,fontSize: 12),),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 14,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage:
                              AssetImage('assets/images/no_user.jpg'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "ID: ",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "22421211413",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              new LinearPercentIndicator(
                                width: 150.0,
                                lineHeight: 20.0,
                                percent: 0.6,
                                progressColor: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Switch.adaptive(
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.red,
                              value: firstValue,
                              onChanged: (value) => setState(() => this.firstValue = value),
                            ),
                          ),
                          Container(
                            child: Text("3/5", style: TextStyle(color: Colors.white,fontSize: 12),),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 14,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage:
                              AssetImage('assets/images/no_user.jpg'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "ID: ",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "22421211413",
                                      style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              new LinearPercentIndicator(
                                width: 150.0,
                                lineHeight: 20.0,
                                percent: 1,
                                progressColor: Colors.redAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Switch.adaptive(
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.red,
                              value: secondValue,
                              onChanged: (value) => setState(() => this.secondValue = value),
                            ),
                          ),
                          Container(
                            child: Text("5/5", style: TextStyle(color: Colors.white,fontSize: 12),),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
