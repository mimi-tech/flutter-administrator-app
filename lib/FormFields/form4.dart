import 'package:employee/utils/colors.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/tab_construct.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:employee/FormFields/form1.dart';
import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/regConst.dart';
import 'package:employee/utils/regText.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class FormFour extends StatefulWidget {
  FormFour({@required this.moveToNext});
  final Function moveToNext;
  @override
  _FormFourState createState() => _FormFourState();
}

class _FormFourState extends State<FormFour> {
  Color btnColor = kTextFieldBorderColor;
  TextEditingController designation = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }



  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Column(
        children: [
          spacer(),

          TabConstruct(),
          spacer(),

          spacer(),

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(kDesignation, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

                  Platform.isIOS
                      ? CupertinoTextField(
                    controller: designation,
                    autocorrect: true,
                    autofocus: true,

                    keyboardType: TextInputType.emailAddress,
                    cursorColor: (kTextFieldBorderColor),
                    style: Fonts.textSize,
                    placeholderStyle: GoogleFonts.oxanium(
                      fontSize: ScreenUtil().setSp(
                          kFontSize, allowFontScalingSelf: true),
                      color: kHintColor,
                    ),
                    placeholder: 'designation',
                    onChanged: (String value) {
                      GlobalVariables.designation = value;

                    },
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorder),
                        border: Border.all(color: kNavyBlue)),
                  )
                      : TextFormField(
                    controller: designation,
                    autocorrect: true,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: (kTextFieldBorderColor),
                    keyboardType: TextInputType.text,
                    style: Fonts.textSize,
                    decoration: Constants.designationInput,
                    validator: RegValidation.validateDesignation,
                    onSaved: (String value) {
                      GlobalVariables.designation = value;

                    },
                    onChanged: (String value) {
                      GlobalVariables.designation = value;
                      //check if the user has input any character inorder to change the color of the next button
                      if  (GlobalVariables.designation == '') {
                        setState(() {
                          btnColor = kTextFieldBorderColor;
                        });
                      } else {
                        setState(() {
                          btnColor = kNavyBlue;
                        });
                      }
                    },
                  ),




                ],
              ),
            ),
          ),
          spacer(),
          NewBtn(title: kCreate.toUpperCase(),bgColor:btnColor ,nextFunction: (){_createEmployee();},)

        ],
      ),
    );
  }

  void _createEmployee() {
    //validate form
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      widget.moveToNext();

    }
  }
}

