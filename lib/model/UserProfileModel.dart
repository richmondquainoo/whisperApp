class UserProfileModel {
  final int id;
  final String picture;
  final String profileName;
  final String name;
  final String fingerPrint;
  final String loginPin;
  final String phone;
  final String email;

  UserProfileModel({
    this.id,
    this.picture,
    this.profileName,
    this.name,
    this.fingerPrint,
    this.loginPin,
    this.phone,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "picture": picture,
      "profileName": profileName,
      "name": name,
      "fingerPrint": fingerPrint,
      "loginPin": loginPin,
      "phone": phone,
      "email": email,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "picture": picture,
      "profileName": profileName,
      "name": name,
      "fingerPrint": fingerPrint,
      "loginPin": loginPin,
      "phone": phone,
      "email": email,
    };
  }

  @override
  String toString() {
    return 'UserProfileModel{id: $id, picture: $picture, profileName: $profileName, name: $name, fingerPrint: $fingerPrint, loginPin: $loginPin, phone: $phone, email: $email}';
  }
}
