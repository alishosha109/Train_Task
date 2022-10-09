class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? bio;
  String? profilePicture;
  int? points;
  String? mobile;
  String? countryCode;
  bool? isVerified;
  bool? isTrusted;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.bio,
      this.profilePicture,
      this.points,
      this.mobile,
      this.countryCode,
      this.isVerified,
      this.isTrusted});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    points = json['points'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    isVerified = json['is_verified'];
    isTrusted = json['isTrusted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['profile_picture'] = this.profilePicture;
    data['points'] = this.points;
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    data['is_verified'] = this.isVerified;
    data['isTrusted'] = this.isTrusted;
    return data;
  }
}
