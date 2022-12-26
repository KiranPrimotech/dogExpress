import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InterfaceValidation {
  String? handleEmail(String value) {}
  String? handleFirst(String value) {}
  String? handleLast(String value) {}
  String? handelPhone(String value) {}
  String? handleBirthday(String value) {}
  String? handleCountry(String value) {}
}

enum FormType{
  firstName,
  lastname,
  email,
  password,
  phone,
  gender,
  country,
  birthday
}
