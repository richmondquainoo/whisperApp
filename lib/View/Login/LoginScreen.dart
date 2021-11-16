import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/View/Registration/RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  var togglecall;
  LoginScreen({this.togglecall});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //variable to check is biometric is there or not
  bool _hasBiometricSensor;
  // list of finger print added in local device settings
  List<BiometricType> _availableBiomatrics;
  String _isAuthorized = "NOT AUTHORIZED";
  LocalAuthentication authentication = LocalAuthentication();
  //future function to check if biometric senson is available on device
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

//future function to get the list of Biometric or faceID added into device
  Future<void> _getListofBiometric() async {
    List<BiometricType> ListofBiometric;
    try {
      ListofBiometric = await authentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiomatrics = ListofBiometric;
    });
  }

  ////future function to check is the use is authorized or no
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
    // TODO: implement initState
    _checkForBiometric();
    _getListofBiometric();
    _getAuthentication();
  }

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 22,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
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
                        child: Text(
                          "Set your login pin and fingerprint",
                          style: GoogleFonts.lato(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border.all(
                              color: Colors.blueAccent, // set border color
                              width: 0.95), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          obscureText: true,
                          // style: TextStyle(color: Colors.black),
                          // controller: fullNameController,
                          // onChanged: (value) {
                          //   fullName = value;
                          // },
                          decoration: InputDecoration(
                            hintText: '**** Security Pin',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Icon(
                          Icons.fingerprint_outlined,
                          color: Colors.blueAccent,
                          size: 88,
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
                      TextButtonComponent(
                        label: "Login",
                        onTap: () {
                          bool canProceed = isValidEntries(context);
                          if (canProceed) {
                            _getAuthentication();
                          }
                        },
                        labelColor: Colors.blueAccent,
                      ),
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
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RegistrationScreen(),
                        //   ),
                        // );
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
}
