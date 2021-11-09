
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40,top: 25),
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
                          radius: 60,
                          backgroundImage: AssetImage('assets/images/man.jpg'),
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
                              onPressed: () => {},
                              child: SvgPicture.asset(
                                  "assets/images/Camera Icon.svg",),
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
                labelText: "Username",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                  size: 22,
                ),
                suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.black38,
                  size: 22,
                ),
              ),
            ),
            SizedBox(height: 9,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Number",
                prefixIcon: Icon(
                  Icons.phone_sharp,
                  color: Colors.blueAccent,
                  size: 22,
                ),
                suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.black38,
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
  }
