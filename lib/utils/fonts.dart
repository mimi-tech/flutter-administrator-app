
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class Fonts{


  static final textSize = TextStyle(
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kBlackColor,
  );

  static final titleSize = TextStyle(
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kNavyBlue,
  );

  static final countSize = TextStyle(
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kWhiteColor,
  );

  static final countryStyle = TextStyle(
    fontSize: ScreenUtil().setSp(14, allowFontScalingSelf: true),
    color: kWhiteColor,
    fontWeight: FontWeight.bold
  );

  static final driverLicence = TextStyle(
    fontSize: ScreenUtil().setSp(12, allowFontScalingSelf: true),
    color: kBlackColor,
  );
}