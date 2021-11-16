import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/View/Login/FingerprintScreen.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';

class SetPinScreen extends StatefulWidget {
  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  var firstPinController = TextEditingController();
  var secondPinController = TextEditingController();

  String firstPin;
  String secondPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 25,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Container(
                    //     child: Text(
                    //       "Change Password",
                    //       style: GoogleFonts.lato(
                    //           color: Colors.blueAccent,
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 85,
                          child: Image(
                            color: Colors.blueAccent,
                            image: AssetImage(
                              "assets/images/password.png",
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          "Enter 4 digit pin",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          // color: Colors.black38,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 0.95), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          // style: TextStyle(color: Colors.white),
                          obscureText: true,
                          controller: firstPinController,
                          onChanged: (value) {
                            firstPin = value;
                          },
                          decoration: InputDecoration(
                            // labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Set pin',
                            hintStyle: TextStyle(
                                // color: Colors.white,
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          // color: Colors.black38,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 0.95), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          // style: TextStyle(color: Colors.white),
                          obscureText: true,
                          controller: secondPinController,
                          onChanged: (value) {
                            secondPin = value;
                          },
                          decoration: InputDecoration(
                            // labelStyle: TextStyle(color: Colors.white),
                            // hintStyle: TextStyle(
                            //   color: Colors.white,
                            // ),
                            // fillColor: Colors.grey,
                            // filled: true,
                            hintText: 'Confirm Pin',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FingerprintScreen(),
                            ),
                          );
                        },
                        child: Container(
                          child: Text(
                            "Use fingerprint instead",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 1.5,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      TextButtonComponent(
                        label: "Done",
                        onTap: () {
                          bool canProceed = isValidEntries(context);
                          if (canProceed) {
                            // OTPModel model = OTPModel(
                            //   // name: fullName,
                            //   // email: email,
                            //   // pin: pin,
                            // );
                            new UtilityService().confirmationBox(
                                title: 'Confirmation',
                                message:
                                    'Are you sure you want to always login with this pin?',
                                context: context,
                                color: Colors.blueAccent,
                                onYes: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingsScreen()));
                                },
                                onNo: () {
                                  Navigator.pop(context);
                                });
                          }
                        },
                        labelColor: Colors.blueAccent,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(30.0),
                      //   child: Container(
                      //     child: Align(
                      //       alignment: FractionalOffset.bottomCenter,
                      //       child: Column(
                      //         children: [
                      //           Divider(
                      //             thickness: 0.3,
                      //             color: Colors.white,
                      //           ),
                      //           SizedBox(
                      //             height: 6,
                      //           ),
                      //           Center(
                      //             child: Container(
                      //               child: Text(
                      //                 'Version 1.1.0',
                      //                 style: GoogleFonts.lato(
                      //                     fontSize: 13,
                      //                     fontWeight: FontWeight.w400,
                      //                     color: Colors.blueAccent),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEntries(BuildContext context) {
    if (firstPinController.text.length == 0 ||
        firstPinController.text.length < 4 ||
        firstPinController.text.length > 5) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter pin',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else if (secondPinController.text.length == 0 ||
        secondPinController.text.length >= 5 ||
        secondPinController.text.length < 4) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter a 4 digit pin',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else if (firstPinController.text != secondPinController.text) {
      new UtilityService().showMessage(
        context: context,
        message: 'Pin does not match',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else {
      return true;
    }
    return false;
  }
}
