import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/OtpModel.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';
import 'package:whisper_badbadoo/storage/UserDBImp.dart';

class FingerprintScreen extends StatefulWidget {
  final OTPModel otpModel;
  FingerprintScreen({this.otpModel});

  @override
  _FingerprintScreenState createState() =>
      _FingerprintScreenState(otpModel: otpModel);
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final OTPModel otpModel;
  _FingerprintScreenState({this.otpModel});

  var profileNameController = TextEditingController();
  UserDBImplementation dbImplementation = UserDBImplementation();
  String profileName;

  @override
  void initState() {
    super.initState();
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

                      SizedBox(
                        height: 85,
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
                          controller: profileNameController,
                          onChanged: (value) {
                            profileName = value;
                          },
                          decoration: InputDecoration(
                            // labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Enter profile name',
                            hintStyle: TextStyle(
                              // color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 85,
                          child: Image(
                            color: Colors.blueAccent,
                            image: AssetImage(
                              "assets/images/fingerprint.png",
                            ),
                          )),
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
                        alignment: Alignment.bottomCenter,
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

                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: TextButtonComponent(
                      //     label: "Done",
                      //     onTap: () async {
                      //       _getAuthentication();
                      //       UserProfileModel model = UserProfileModel(
                      //         name: otpModel.name,
                      //         phone: otpModel.phone,
                      //         email: otpModel.email,
                      //         fingerPrint: 'Yes',
                      //         profileName: 'admin',
                      //         //add profile name and pic
                      //       );
                      //       await dbImplementation.saveUser(model);
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => SettingsScreen()));
                      //     },
                      //     labelColor: Colors.blueAccent,
                      //   ),
                      // ),
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
}
