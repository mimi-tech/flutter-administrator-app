import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeAppbar extends StatefulWidget implements PreferredSizeWidget{
  HomeAppbar({@required this.title});
  final String title;
  @override
  _HomeAppbarState createState() => _HomeAppbarState();
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);


}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: kNavyBlue,
      title: Text(widget.title.toUpperCase(),
        style:GoogleFonts.oxanium(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
          color: kWhiteColor,
        ),
      ),
    );
  }
}
