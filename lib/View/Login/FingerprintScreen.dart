import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';

class FingerprintScreen extends StatefulWidget {
  @override
  _FingerprintScreenState createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  //variable to check whether biometric is there or not
  bool _hasBiometricSensor;
  // list of finger print added in local device settings
  List<BiometricType> _availableBiometrics;
  String _isAuthorized = "NOT AUTHORIZED";
  LocalAuthentication authentication = LocalAuthentication();
  //future function to check if biometric sensor is available on device
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
      _availableBiometrics = ListofBiometric;
    });
  }

  ////future function to check whether the usage of the fingerprint is authorized or no
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
                Container(
                  child: Text(
                    "Login using your biometric credentials",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 85,
                          child: Image(
                            color: Colors.blueAccent,
                            image: AssetImage(
                              "assets/images/fingerprint.png",
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Text(
                          "Touch your fingerprint sensor",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        child: Text(
                          "Use your fingerprint for faster access to the chat section",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextButtonComponent(
                          label: "Done",
                          onTap: () {
                            _getAuthentication();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                            // bool canProceed = isValidEntries(context);
                            // if (canProceed) {
                            //   OTPModel model = OTPModel(
                            //     // name: fullName,
                            //     // email: email,
                            //     // pin: pin,
                            //   );
                            //   new UtilityService().confirmationBox(
                            //       title: 'Confirmation',
                            //       message: 'Are you sure you want to proceed with the registration?',
                            //       context: context,
                            //       color: Colors.blueAccent,
                            //       onYes: (){
                            //         Navigator.pop(context);
                            //         createOTP(
                            //             context: context, dataModel: model);
                            //       },
                            //       onNo: (){
                            //         Navigator.pop(context);
                            //       }
                            //   );
                            //
                            // }
                          },
                          labelColor: Colors.blueAccent,
                        ),
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
}
