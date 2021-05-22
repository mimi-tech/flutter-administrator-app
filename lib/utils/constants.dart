import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Constants{

  ///Email decoration
  static final emailInput = InputDecoration(

      hintText: 'Email',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );

  ///Password decoration
  static final passwordInput = InputDecoration(

      hintText: 'Password',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );


  ///First name decoration
  static final firstNameInput = InputDecoration(

      hintText: 'First name',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );




  ///Last name decoration
  static final lastNameInput = InputDecoration(

      hintText: 'Last name',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );


  ///date of birth decoration
  static final dobInput = InputDecoration(

      hintText: 'Date of birth',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );
  ///address decoration
  static final addressInput = InputDecoration(

      hintText: 'Address',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );


  ///country decoration
  static final countryInput = InputDecoration(

      hintText: 'Country',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );

  ///country decoration
  static final stateInput = InputDecoration(

      hintText: 'State',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );

  ///designation decoration
  static final designationInput = InputDecoration(

      hintText: 'Designation',
      hintStyle:GoogleFonts.oxanium(
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: kHintColor,
      ),
      contentPadding: EdgeInsets.fromLTRB(
          20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              kBorder)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kNavyBlue))



  );

  /// search decoration

  static final searchInput = InputDecoration(
    prefixIcon: Icon(Icons.search,color: kNavyBlue,),
    hintText: "Search...",
    hintStyle:GoogleFonts.oxanium(
      fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
      color: kHintColor,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide:
      BorderSide(color: kBlackColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kBlackColor),


    ),
    border:
    OutlineInputBorder(borderSide: BorderSide(color: kBlackColor)),
  );
}


