import 'package:flutter/material.dart';

class UserProfileModel {
  final String picUpload;
  final String profileName;
  final String setPin;
  final String fingerPrint;

  UserProfileModel(
      {
        this.picUpload,
        @required this.profileName,
        this.setPin,
        this.fingerPrint
      });

  Map<String, dynamic> toMap(){
    return{
      "picUpload":picUpload,
      "profileName":profileName,
      "setPin": setPin,
      "fingerPrint":fingerPrint
    };
  }

  @override
  String toString() {
    return 'UserProfileModel{picUpload: $picUpload, profileName: $profileName, setPin: $setPin, fingerPrint: $fingerPrint}';
  }

  Map<String, dynamic> toJson(){
    return{
      "picUpload":picUpload,
      "profileName":profileName,
      "setPin": setPin,
      "fingerPrint":fingerPrint
    };
  }

}
