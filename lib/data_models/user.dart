import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.birtDate,
    this.religion,
    this.phoneNumber,
    this.email,
  });

  int? id;
  String? firstName;
  String? lastName;
  Gender? gender;
  DateTime? birtDate;
  Religion? religion;
  String? phoneNumber;
  String? email;
}

enum Gender { men, woman }

enum Religion {
  buddhism,
  christianity,
  islam,
  hinduism,
  taoism,
  animism,
  other,
}
