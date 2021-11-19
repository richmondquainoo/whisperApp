import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';
import 'package:whisper_badbadoo/model/UserProfileModel.dart';
import 'package:whisper_badbadoo/storage/UserDB.dart';
import 'dart:io';

import 'package:whisper_badbadoo/storage/UserDBImp.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileNameController = TextEditingController();
  var nameController = TextEditingController();

  String profileName;
  String name;


  File imageFile;
  final picker = ImagePicker();

  UserDBImplementation dbImplementation = UserDBImplementation();
  UserDB userDB = UserDB();
  UserProfileModel user;
  @override
  void initState() {
    super.initState();
    initializeDB();
  }

  void initializeDB() async {
    try {
      await userDB.initialize();
      getUserInfo();
    } catch (e) {
      print('init err: $e');
    }
  }

  void getUserInfo() async {
    UserProfileModel u = await dbImplementation.getUser();
    setState(() {
      user = u;
    });
  }

  // File _image;
  // final imagePicker = ImagePicker();
  //
  // Future getImage() async{
  //   final image = await imagePicker.getImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = File(image);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: GoogleFonts.lato(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
          child: Column(
            children: [
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
                                ?
                              Image.file(imageFile)
                              // height: 300.0,
                              // fit: BoxFit.scaleDown,
                                : AssetImage('assets/images/no_user.jpg'),
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
                                  final pickedFile =
                                  await picker.getImage(source: ImageSource.gallery);
                                  print('picker: ${pickedFile}');
                                  if (pickedFile != null) {
                                    File croppedFile = await ImageCropper.cropImage(
                                      sourcePath: pickedFile.path,
                                      aspectRatioPresets: [
                                        CropAspectRatioPreset.square,
                                        CropAspectRatioPreset.ratio3x2,
                                        CropAspectRatioPreset.original,
                                        CropAspectRatioPreset.ratio4x3,
                                        CropAspectRatioPreset.ratio16x9
                                      ],
                                      androidUiSettings: AndroidUiSettings(
                                        toolbarTitle: 'Cropper',
                                        toolbarColor: Colors.green[700],
                                        toolbarWidgetColor: Colors.white,
                                        activeControlsWidgetColor: Colors.green[700],
                                        initAspectRatio: CropAspectRatioPreset.original,
                                        lockAspectRatio: false,
                                      ),
                                      iosUiSettings: IOSUiSettings(
                                        minimumAspectRatio: 1.0,
                                      ),
                                    );
                                    if (croppedFile != null){
                                      setState(() {
                                        imageFile = croppedFile;

                                      });
                                      print('imageFile: $imageFile');
                                    }
                                  }
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
                height: 7,
              ),
              TextField(
                controller: profileNameController,
                onChanged: (value) {
                  profileName = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // labelStyle: TextStyle(
                  //   color: Colors.white,
                  // ),
                  hintText: (user != null && user.profileName != null)
                      ? user.profileName
                      : "user",
                  labelText: "Profile name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                    size: 22,
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    // color: Colors.black38,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                onChanged: (value) {
                  name = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // labelStyle: TextStyle(
                  //   color: Colors.white,
                  // ),
                  hintText: (user != null && user.name != null)
                      ? user.name
                      : "name",
                  labelText: "Full name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                    size: 22,
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    // color: Colors.black38,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // labelStyle: TextStyle(
                  //   color: Colors.white,
                  // ),
                  hintText: (user != null && user.phone != null)
                      ? user.phone
                      : "number",
                  prefixIcon: Icon(
                    Icons.phone_sharp,
                    color: Colors.blueAccent,
                    size: 22,
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    // color: Colors.black38,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // labelStyle: TextStyle(
                  //   color: Colors.white,
                  // ),
                  hintText: (user != null && user.profileName != null)
                      ? user.email
                      : "userMail",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                    size: 22,
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    // color: Colors.black38,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: TextButtonComponent(
                    borderRadius: 9,
                    labelColor: Colors.blueAccent,
                    label: 'Save',
                    onTap: () {
                      bool canProceed = canUploadChanges();
                      if(canProceed){
                        new UtilityService().confirmationBox(
                            color: Colors.blueAccent,
                            context: context,
                            title: 'Edit Profile',
                            message:
                            'Are you sure you want to edit your profile?',
                            onNo: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            onYes: () {
                              // Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                              Navigator.of(context, rootNavigator: true).pop();
                            }
                        );
                      }else{
                        new UtilityService().singleButtonConfirmation(
                          title: "Edit Profile",
                          context: context,
                          message: "No change in profile name or name",
                          buttonLabel: "OK",
                          buttonWidth: 100,
                          buttonHeight: 50,
                          onYes: (){
                            Navigator.pop(context);
                          },
                          color: Colors.blueAccent,
                        );
                      }

                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool canUploadChanges(){
    return ((profileNameController.text.length >0 && (profileNameController.text != user.profileName )) ||
        (nameController.text.length >0 && (nameController.text != user.name)
    ));
  }

  bool isValidEntries(BuildContext context) {



    if ((profileNameController.text.length ==0)) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter username',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    }  if (nameController.text.length == 0) {
      new UtilityService().showMessage(
        context: context,
        message: 'Please enter full name',
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      );
      return false;
    } else {
      return true;
    }
  }

}
