import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File imageFile;
  // String imagePath = "";
  final picker = ImagePicker();

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
      body: Padding(
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
              height: 7,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // labelStyle: TextStyle(
                //   color: Colors.white,
                // ),
                labelText: "Username",
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
              height: 9,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // labelStyle: TextStyle(
                //   color: Colors.white,
                // ),
                labelText: "Number",
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
          ],
        ),
      ),
    );
  }

  // Future selectOrTakePhoto(ImageSource imageSource) async {
  //   final pickedFile = await picker.getImage(source: imageSource);
  //
  //   setState(() {
  //     _image = File(image.path);
  //   }
  // }
  //
  // Future _showSelectionDialog() async {
  //   await showDialog(
  //     context: context,
  //     child: SimpleDialog(
  //         title: Text('Select photo'),
  //         children: <Widget>[
  //     SimpleDialogOption(
  //     child: Text('From gallery'),
  //     onPressed: () {
  //       selectOrTakePhoto(ImageSource.gallery);
  //       Navigator.pop(context);
  //     },
  //   ),
  //   SimpleDialogOption(
  //   child: Text('Take a photo'),
  //   onPressed: () {
  //   selectOrTakePhoto(ImageSource.camera);
  //   Navigator.pop(context);
  //   },
  //   );

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
