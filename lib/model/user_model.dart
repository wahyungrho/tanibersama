part of 'models.dart';

class UserModel {
  final String? idUser;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final String? pin;
  final String? status;
  final String? createdAt;

  UserModel(
      {this.idUser,
      this.fullName,
      this.email,
      this.phone,
      this.password,
      this.pin,
      this.status,
      this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id'],
      fullName: json['name'],
      email: json['email'],
      phone: json['phone'],
      pin: json['pin'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}
