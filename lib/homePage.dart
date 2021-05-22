import 'package:employee/Admin/employee_screen_one.dart';
import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget spacer() {
    return SizedBox(height: MediaQuery
        .of(context)
        .size
        .height * 0.02);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height);
    return SafeArea(child: Scaffold(

       appBar: HomeAppbar(title: kCompanyName,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kHorizontal),
          child: Column(
            children: [
              spacer(),
              spacer(),
              Text('Welcome',
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
                  color: kBlackColor,
                ),
              ),
              Text(GlobalVariables.loggedInUser,
                textAlign: TextAlign.center,
                style: GoogleFonts.oxanium(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(
                      kFontSize, allowFontScalingSelf: true),
                  color: kNavyBlue,
                ),
              ),
              spacer(),
              Text(kLorem,
                textAlign: TextAlign.center,
                style: GoogleFonts.oxanium(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(
                      kFontSize, allowFontScalingSelf: true),
                  color: Colors.grey,
                ),
              ),
              spacer(),
              spacer(),

              NewBtn(nextFunction: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreenOne()));

              }, bgColor: kOrangeColor, title: kCreate),
              spacer(),
              spacer(),
              NewBtn(nextFunction: (){}, bgColor: kNavyBlue, title: kView),
              spacer(),
              spacer(),


            ],
          ),
        ),
      ),
    ));
  }
}
