class UserModel {
  String? id;
  String phoneNumber;
  String username;
  String firstName;
  String lastName;
  String password;
  String dateOfBirth;
  String gender;
  String? createdAt;

  //Constructor
  UserModel({
    this.id,
    required this.phoneNumber,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.dateOfBirth,
    required this.gender,
    this.createdAt,
  });

  //this is a static method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        gender: json['gender'],
        dateOfBirth: json['dateOfBirth'],
        createdAt: json['createdAt'],
        username: json['userName']);
  }
}
