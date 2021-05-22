import 'package:employee/utils/colors.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxnConstruction extends StatelessWidget {
  TxnConstruction({
    @required this.fName,
    @required this.lName,
    @required this.address,
    @required this.country,
    @required this.state,
    @required this.gender,
    @required this.designation,
    @required this.passport,
    @required this.dob,

  });
  final dynamic designation;
  final dynamic fName;
  final dynamic lName;
  final dynamic address;
  final dynamic country;
  final dynamic state;
  final dynamic gender;
  final dynamic passport;
  final dynamic dob;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: FileImage(passport),
                  radius: 30,

                ),
                Column(
                  children: [
                    Text(fName,
                      style:GoogleFonts.oxanium(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
                        color: kBlackColor,
                      ),
                    ),

                    Text(lName,
                      style:GoogleFonts.oxanium(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            ShowRichText(header: 'Address: ',title: address,),
            ShowRichText(header: 'Country: ',title: country,),
            ShowRichText(header: 'State: ',title: state,),
            ShowRichText(header: 'designation: ',title: designation,),
            ShowRichText(header: 'Gender: ',title: gender,),
            ShowRichText(header: 'DOB: ',title: dob,),



          ],
        ),
      ),
    );
  }
}


class ShowRichText extends StatelessWidget {
  ShowRichText({@required this.header,@required this.title});
  final String header;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(

            text: TextSpan(text: '${header.toUpperCase()}',
                style: GoogleFonts.oxanium(
                  fontSize: ScreenUtil().setSp(
                      kFontSize, allowFontScalingSelf: true),
                  color: kNavyBlue,
                  fontWeight: FontWeight.bold
                ),

                children: <TextSpan>[
                  TextSpan(
                    text: title,
                    style: GoogleFonts.oxanium(
                      fontSize: ScreenUtil().setSp(
                          14, allowFontScalingSelf: true),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ]
            ),


          ),
        ),
        Divider(),
      ],
    );
  }
}
