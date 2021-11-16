import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:whisper_badbadoo/Component/ProgressDialog.dart';
import 'package:whisper_badbadoo/Component/TopBarComponent.dart';
import 'package:whisper_badbadoo/Util/NetworkUtility.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/Util/paths.dart';
import 'package:whisper_badbadoo/View/Login/LoginScreen.dart';
import 'package:whisper_badbadoo/View/Login/SetPin.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/OtpModel.dart';

class OtpScreen extends StatefulWidget {
  final OTPModel otpModel;
  var togglecall;
  OtpScreen({this.otpModel, this.togglecall});

  @override
  _OtpScreenState createState() => _OtpScreenState(otpModel: otpModel);
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final OTPModel otpModel;

  String globalPin;

  _OtpScreenState({this.otpModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TopBarComponent(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 25,
                      color: Colors.blueAccent,
                    ),
                    iconFunction: () {
                      Navigator.pop(context);
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "Verification",
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Icon(
                  Icons.verified_user_sharp,
                  color: Colors.blueAccent,
                  size: 75,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter the verification code we just sent to your email address.',
                    style: GoogleFonts.lato(
                      fontSize: 16.5,
                      wordSpacing: 1.0,
                      fontWeight: FontWeight.w500,
                      // color: Colors.blueGrey
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 50,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                      setState(() {
                        globalPin = (pin);
                        // print("globalPin: $globalPin");
                      });
                      registration(context);
                    },
                    obscureText: true,
                    onChanged: (pin) {
                      globalPin = (pin);
                      print("globalPin: $globalPin");
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Didn't receive a code?",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      createOTP(context: context, dataModel: otpModel);
                    },
                    child: Container(
                      child: Text(
                        "Resend",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //  Validate input fields
                        //  Compare the input text to the one provided by the user
                        registration(context);


                      },
                      child: Container(
                        height: 45,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1.6, 1.6),
                              color: Colors.black12,
                            ),
                          ],
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registration(BuildContext context) {
    //  Validate input fields
    //  Compare the input text to the one provided by the user
    bool canProceed = isValidInput(context);
    if (canProceed) {
      registerUser(otpModel: otpModel, context: context);
      // new UtilityService().showMessage();
    }
  }

  bool isValidInput(BuildContext context) {
    print("Input Value:${otpModel.pin.toString()}");
    if (globalPin == null) {
      new UtilityService().showMessage(
          message: 'Please enter pin',
          context: context,
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
          ));
      return false;
    } else if (globalPin != otpModel.pin.toString()) {
      new UtilityService().showMessage(
          message: 'Invalid pin',
          context: context,
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
          ));
      return false;
    } else {
      return true;
    }
  }

  void registerUser({OTPModel otpModel, BuildContext context}) async {
    showDialog(
      context: context,
      builder: (context) {
        return ProgressDialog(displayMessage: 'Please wait...');
      },
    );
    print(otpModel);
    var jsonBody = jsonEncode(otpModel);
    NetworkUtility networkUtility = NetworkUtility();
    Response response = await networkUtility.postDataWithAuth(
        url: CREATE_USER_URL, body: jsonBody, auth: 'Bearer $ACCESS_TOKEN');

    var data = jsonDecode(response.body);
    Navigator.of(context, rootNavigator: true).pop();

    int status = data['status'];
    print('body: $data');
    // Handle network error
    if (status == 500 || status == 404 || status == 403) {
      new UtilityService().showMessage(
        message:
            'An error has occurred whiles creating account. Please try again',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        context: context,
      );
    } else if (status == -333) {
      // new UtilityService().showMessage(
      //   message: 'An account with this email address already exist.',
      //   icon: Icon(
      //     Icons.error_outline,
      //     color: Colors.red,
      //   ),
      //   context: context,
      // );
      Navigator.of(context, rootNavigator: true).pop();
      new UtilityService().notificationMessageWithButton(
          title: "Retry",
          message:
              "Account already exist with this email. Please login to proceed.",
          context: context,
          backgroundColor: Colors.white,
          color: Colors.blue,
          buttonText: "Login",
          textColor: Colors.red,
          proceed: () {
            Navigator.of(context,rootNavigator: true).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            // Navigator.of(context,rootNavigator: true).pop();
          });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SetPinScreen()));
    }
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

      if (response == null) {
        //error handling
        new UtilityService().showMessage(
          context: context,
          message: 'An error has occurred. Please try again',
          icon: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        );
      } else {
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
              color: Colors.red,
            ),
            context: context,
          );
        } else {
          print('Body: ${response.body}');
          OTPModel otpModel = new OTPModel(
            name: data['data']['name'],
            email: data['data']['email'],
            pin: data['data']['pin'],
            phone: data['data']['phone'],
            // password: passwordController.text,
          );
          print('otp: $otpModel');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                otpModel: otpModel,
              ),
            ),
          );
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
