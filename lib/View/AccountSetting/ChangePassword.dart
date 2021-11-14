import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:whisper_badbadoo/Component/ProgressDialog.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/NetworkUtility.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/Util/paths.dart';
import 'package:whisper_badbadoo/View/Otp/OtpScreen.dart';
import 'package:whisper_badbadoo/model/OtpModel.dart';

class ChangePassword extends StatefulWidget {

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var repeatPasswordController = TextEditingController();


  String oldPassword;
  String newPassword;
  String repeatPassword;

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
                      onTap: (){
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
                        height: 50,
                        child: Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                          size: 63,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height:45,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 1.6), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: oldPasswordController,
                          onChanged: (value) {
                            oldPassword = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Old Pin',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:45,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 1.6), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: newPasswordController,
                          onChanged: (value) {
                            newPassword = value;
                          },
                          decoration: InputDecoration(
                            // fillColor: Colors.grey,
                            // filled: true,
                            hintText: 'New Pin',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:45,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 1.6), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: repeatPasswordController,
                          onChanged: (value) {
                            repeatPassword = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Repeat Pin',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButtonComponent(
                        label: "Done",
                        onTap: () {
                          bool canProceed = isValidEntries(context);
                          if (canProceed) {
                            OTPModel model = OTPModel(
                              // name: fullName,
                              // email: email,
                              // pin: pin,
                            );
                            new UtilityService().confirmationBox(
                                title: 'Confirmation',
                                message: 'Are you sure you want to proceed with the registration?',
                                context: context,
                                color: Colors.blueAccent,
                                onYes: (){
                                  Navigator.pop(context);
                                  createOTP(
                                      context: context, dataModel: model);
                                },
                                onNo: (){
                                  Navigator.pop(context);
                                }
                            );

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
    if (oldPasswordController.text.length == 0) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter old password',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else if (newPasswordController.text.length < 5) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter new password',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else if (repeatPasswordController.text.length < 5) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please repeat password',
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

  void createOTP({OTPModel dataModel, BuildContext context}) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return ProgressDialog(displayMessage: 'Please wait...');
        },
      );
      var jsonBody = jsonEncode(dataModel);
      NetworkUtility networkUtility = NetworkUtility();
      Response response = await networkUtility.postDataWithAuth(
          url: OTP_URL, body: jsonBody, auth: 'Bearer $ACCESS_TOKEN');

      print('Response: ${response.body}');


      Navigator.of(context, rootNavigator: true).pop();

      if(response == null){
        //error handling
        new UtilityService().showMessage(
          context: context,
          message: 'An error has occurred. Please try again',
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        );
      }else{
        // //when there is a response to handle
        // int status = response.statusCode;
        var data = jsonDecode(response.body);

        int status = data['status'];
        print('Status: $status');
        // Handle network error
        if (status == 500 || status == 404 || status == 403) {
          new UtilityService().showMessage(
            message: 'An error has occurred. Please try again',
            icon: Icon(
              Icons.error_outline,
              color:Colors.red,
            ),
            context: context,
          );
        } else {
          print('Body: ${response.body}');
          OTPModel otpModel = new OTPModel(
            // name: data['data']['name'],
            // email: data['data']['email'],
            password: data['data']['password'],
            // phone: data['data']['phone'],
            // password: passwordController.text,
          );
          print('otp: $otpModel');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(otpModel: otpModel,),),);
        }
      }

    } catch (e) {
      print('postUserData error: $e');
      new UtilityService().showMessage(
        context: context,
        message: 'An error has occurred. Please try again',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
