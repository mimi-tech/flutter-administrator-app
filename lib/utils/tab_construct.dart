import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabConstruct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.business),
        Text(kCompanyName.toUpperCase(),
          style:GoogleFonts.oxanium(
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
            color: kBlackColor,
          ),
        ),
      ],
    );
  }
}
