import 'dart:io';

import 'package:employee/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalVariables{
  /*country and state inputs*/
  static List<dynamic> countryName = <dynamic>[];
  static List<dynamic> countryCode = <dynamic>[];
  static List<dynamic> countryState = <dynamic>[];
  static List<dynamic> convertedCountryState = <dynamic>[];
  static List<dynamic> stateCode = <dynamic>[];
  static String selectedCountryName;
  static String selectedCountryCode;
  static String selectedCountryState;
  static String selectedStateCode;
  static int selectedCountryIndex;
  static TextEditingController country = TextEditingController();
  static TextEditingController state = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static Map myMap;

  /*forms field input*/
  static String fName;
  static String lName;
  static String dob;
  static File imageURI;

  static String address;
  static String email;
  static String password;
  static String designation;
  static String gender;

  static String loggedInUser;


  /*list containing the employee details*/
  static List<dynamic> emFName = <dynamic>[];
  static List<dynamic> emLName = <dynamic>[];
  static List<dynamic> emCountry = <dynamic>[];
  static List<dynamic> emState = <dynamic>[];
  static List<dynamic> emGender = <dynamic>[];
  static List<dynamic> emDob = <dynamic>[];
  static List<dynamic> emPassport = <dynamic>[];
  static List<dynamic> emAddress = <dynamic>[];
  static List<dynamic> emDesignation = <dynamic>[];


  static TextEditingController searchController = TextEditingController();


  static notifyFlutterToastError({@required title})async{
    // String title;
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: kBlackColor,
        textColor: kRedColor);
  }
  static notifyFlutterToastSuccess({@required title})async{
    // String title;
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: kBlackColor,
        textColor: Colors.green);
  }
}