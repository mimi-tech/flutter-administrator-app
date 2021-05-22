
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';

class RegValidation{
  //email validation
  static String validateEmail(String value) {
    if(value.isEmpty) {
      return kEmail;
    }
    return null;
  }
  //first name validation
  static String validatePassword(String value) {
    if(value.isEmpty) {
      return kPassword;
    }else if(value.length < 6){
      return 'Password must be more than six characters';
    }
    return null;
  }
  //first name validation
  static String validateFName(String value) {
    if(value.isEmpty) {
      return kName;
    }
    return null;
  }
//last name validation
  static String validateLName(String value) {
    if(value.isEmpty) {
      return klName;
    }
    return null;
  }

  //dob validation
  static String validateDob(String value) {
    if(value.isEmpty) {
      return kDob;
    }
    return null;
  }

  //address validation
  static String validateAddress(String value) {
    if(value.isEmpty) {
      return kAddress;
    }
    return null;
  }
  //country validation
  static String validateCountry(String value) {
    if(value.isEmpty) {
      return kCountry;
    }
    return null;
  }

  //state validation
  static String validateState(String value) {
    if(value.isEmpty) {
      return kState;
    }
    return null;
  }
//designation validation
  static String validateDesignation(String value) {
    if(value.isEmpty) {
      return kDesignation;
    }
    return null;
  }
}