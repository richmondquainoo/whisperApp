import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whisper_badbadoo/Component/ProgressDialog.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/NetworkUtility.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/Util/paths.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';


class UserProfileDetails extends StatefulWidget {
  @override
  _UserProfileDetailsState createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  File imageFile;
  // String imagePath = "";
  final picker = ImagePicker();

  var profileNameController = TextEditingController();
  var setPinController = TextEditingController();

  String profileName;
  String setPin;

  bool _hasBioSensor;
  LocalAuthentication authentication = LocalAuthentication();
  Future<void> _checkBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;

      if(_hasBioSensor){
        _getAuth();
      }
      print(_hasBioSensor);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;

    try {
      isAuth = await authentication.authenticateWithBiometrics(
        localizedReason: "Scan your finger to access the app",
        useErrorDialogs: true,
        stickyAuth: true,
      );

      if(isAuth){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
      }

      print(isAuth);
      print(_hasBioSensor);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkBio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Profile",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  "Enter Profile Info",
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ),
              ),
              SizedBox(height: 27,),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: imageFile!=null
                                ? FileImage(
                              File(imageFile.path),
                              // height: 300.0,
                              // fit: BoxFit.scaleDown,
                            )
                                : AssetImage('assets/images/no_user.jpg') as ImageProvider,
                          ),
                          Positioned(
                            right: -16,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(color: Colors.black12),
                                ),
                                color: Colors.grey[200],
                                onPressed: () async {
                                 _getFromGallery();
                                  // if (pickedFile != null) {
                                  //   // File croppedFile = await ImageCropper.cropImage(
                                  //   //   sourcePath: pickedFile.path,
                                  //   //   aspectRatioPresets: [
                                  //   //     CropAspectRatioPreset.square,
                                  //   //     CropAspectRatioPreset.ratio3x2,
                                  //   //     CropAspectRatioPreset.original,
                                  //   //     CropAspectRatioPreset.ratio4x3,
                                  //   //     CropAspectRatioPreset.ratio16x9
                                  //   //   ],
                                  //   //   androidUiSettings: AndroidUiSettings(
                                  //   //     toolbarTitle: 'Cropper',
                                  //   //     toolbarColor: Colors.green[700],
                                  //   //     toolbarWidgetColor: Colors.white,
                                  //   //     activeControlsWidgetColor: Colors.green[700],
                                  //   //     initAspectRatio: CropAspectRatioPreset.original,
                                  //   //     lockAspectRatio: false,
                                  //   //   ),
                                  //   //   iosUiSettings: IOSUiSettings(
                                  //   //     minimumAspectRatio: 1.0,
                                  //   //   ),
                                  //   // );
                                  //   if (croppedFile != null){
                                  //     setState(() {
                                  //       imagePath = croppedFile.path;
                                  //     });
                                  //   }
                                  // }
                                },
                                child: SvgPicture.asset(
                                  "assets/images/Camera Icon.svg",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: profileNameController,
                onChanged: (value) {
                  profileName = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Profile name",
                  hintStyle: GoogleFonts.lato(
                      fontSize: 14.7,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                  // prefixIcon: Icon(
                  //   Icons.person,
                  //   color: Colors.blueAccent,
                  //   size: 20,
                  // ),
                  suffixIcon: Icon(
                    Icons.emoji_emotions,
                    color: Colors.black38,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: setPinController,
                onChanged: (value) {
                  setPin = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter 4 digit pin (Optional)",
                  hintStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                  // prefixIcon: Icon(
                  //   Icons.phone_sharp,
                  //   color: Colors.blueAccent,
                  //   size: 20,
                  // ),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.black38,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _checkBio();
                },
                child: Container(
                  child: Icon(
                    Icons.fingerprint_outlined,
                    color: Colors.blueAccent,
                    size: 75,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  "Tap to add finger print",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: TextButtonComponent(
                  label: "Let's go",
                  onTap: () {
                  //  Validating input fields
                    bool canProceed = isValidEntries(context);
                    if(canProceed){
                      UserProfileModel model = UserProfileModel(
                          profileName: profileName,
                          setPin: setPin
                      );
                      createUserProfile(dataModel: model, context: context);
                    }
                  },
                  labelColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isValidEntries(BuildContext context) {
    if (profileNameController.text.length == 0) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter username',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else if (setPinController.text.length != 5) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter your five digit pin',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    }else {
      return true;
    }
    return false;
  }

  void createUserProfile({UserProfileModel dataModel, BuildContext context}) async {
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
          UserProfileModel model = new UserProfileModel(
            profileName: data['data']['name'],
            setPin: data['data']['pin'],
            // password: passwordController.text,
          );
          print('otp: $model');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen(),),);
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

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      // _cropImage(pickedFile.path);
    }
  }

}
