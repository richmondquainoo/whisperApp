import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:local_auth/local_auth.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:whisper_badbadoo/Component/ProgressDialog.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/NetworkUtility.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/Util/paths.dart';
import 'package:whisper_badbadoo/View/Otp/OtpScreen.dart';
import 'package:whisper_badbadoo/View/Registration/RegistrationScreen.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/OtpModel.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';
import 'package:whisper_badbadoo/storage/UserDBImp.dart';

class LoginScreen extends StatefulWidget {
  var togglecall;
  LoginScreen({this.togglecall});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String globalPin;
  var pinController = TextEditingController();
  String pin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.pop(context);
                //         },
                //         child: Container(
                //           child: Icon(
                //             Icons.arrow_back_ios_outlined,
                //             size: 22,
                //             color: Colors.blueAccent,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Column(
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
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        "Login with security pin or use fingerprint",
                        style: GoogleFonts.lato(
                            fontSize: 19, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.all(5),
                      //   padding: EdgeInsets.only(left: 20),
                      //   decoration: BoxDecoration(
                      //     // color: Colors.white,
                      //     border: Border.all(
                      //         color: Colors.blueAccent, // set border color
                      //         width: 0.95), // set border width
                      //     borderRadius: BorderRadius.all(Radius.circular(
                      //         10.0)), // set rounded corner radius
                      //   ),
                      //   child: TextField(
                      //     obscureText: true,
                      //     // style: TextStyle(color: Colors.black),
                      //     // controller: fullNameController,
                      //     // onChanged: (value) {
                      //     //   fullName = value;
                      //     // },
                      //     decoration: InputDecoration(
                      //       hintText: '**** Security Pin',
                      //       border: InputBorder.none,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: OTPTextField(
                            otpFieldStyle: OtpFieldStyle(
                                errorBorderColor: Colors.red,
                                focusBorderColor: Colors.white,
                                borderColor: Colors.white,
                                disabledBorderColor: Colors.grey,
                                enabledBorderColor: Colors.white),
                            length: 4,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 40,
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 40),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            onCompleted: (pin) async {
                              print("Completed: " + pin);
                              setState(() {
                                globalPin = (pin);
                                // print("globalPin: $globalPin");
                              });
                              UserDBImplementation imp = UserDBImplementation();
                              UserProfileModel user =
                                  await imp.getByLoginPin(globalPin);
                              if (user != null && user.loginPin == globalPin) {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsScreen()));
                              } else {
                                new UtilityService().showMessage(
                                  context: context,
                                  message: "Invalid pin",
                                  icon: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                                //display invalid pin toast
                              }
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
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Enter your security pin",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Text(
                          "OR",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Icon(
                          Icons.fingerprint_outlined,
                          color: Colors.blueAccent,
                          size: 120,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _getAuthentication();
                        },
                        child: Container(
                          child: Text(
                            "Tap to use finger print",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              // color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 87,
                      ),
                      // TextButtonComponent(
                      //   label: "Login",
                      //   onTap: () {
                      //     bool canProceed = isValidEntries(context);
                      //     if (canProceed) {
                      //       _getAuthentication();
                      //     }
                      //   },
                      //   labelColor: Colors.blueAccent,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Don't have an account?",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Container(
                        child: Text(
                          "Register",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async{
                    UserDBImplementation imp = UserDBImplementation();
                    UserProfileModel user = await imp.getUser();
                    OTPModel otpModel = OTPModel(name: user.name,email: user.email, phone: user.phone,);
                    createOTP(dataModel: otpModel, context: context);
                  },
                  child: Container(
                    child: Text(
                      "Forgot pin?",
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                      ),
                    ),
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
    if (pinController.text.length != 4) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter pin',
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

  bool _hasBiometricSensor;
  List<BiometricType> _availableBiometrics;
  String _isAuthorized = "NOT AUTHORIZED";
  LocalAuthentication authentication = LocalAuthentication();
  Future<void> _checkForBiometric() async {
    bool hasBiometric;
    try {
      hasBiometric = await authentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasBiometricSensor = hasBiometric;
    });
  }

  Future<void> _getListOfBiometric() async {
    List<BiometricType> listOfBiometric;
    try {
      listOfBiometric = await authentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometrics = listOfBiometric;
    });
  }

  Future<void> _getAuthentication() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await authentication.authenticateWithBiometrics(
          localizedReason: "SCAN YOUR FINGER PRINT TO GET AUTHORIZED",
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _isAuthorized = isAuthorized ? "AUTHORIZED" : "NOT AUTHORIZED";
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _checkForBiometric();
    _getListOfBiometric();
    _getAuthentication();
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
                track: 'Reset',
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
