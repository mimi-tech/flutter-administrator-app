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


class FormThree extends StatefulWidget {
  FormThree({@required this.moveToNext});
  final Function moveToNext;
  @override
  _FormThreeState createState() => _FormThreeState();
}

class _FormThreeState extends State<FormThree> {
  Color btnColor = kTextFieldBorderColor;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

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

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(kEmail, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

                  Platform.isIOS
                      ? CupertinoTextField(
                    controller: _email,
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
                    placeholder: 'Email',
                    onChanged: (String value) {
                      GlobalVariables.email = value;

                    },
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorder),
                        border: Border.all(color: kNavyBlue)),
                  )
                      : TextFormField(
                    controller: _email,
                    autocorrect: true,
                    autofocus: true,
                    cursorColor: (kTextFieldBorderColor),
                    keyboardType: TextInputType.emailAddress,
                    style: Fonts.textSize,
                    decoration: Constants.emailInput,
                    validator: RegValidation.validateEmail,
                    onSaved: (String value) {
                      GlobalVariables.email = value;
                    },
                  ),


                         ///displaying password field
                  spacer(),
                  Text(kPassword, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

                  Platform.isIOS
                      ? CupertinoTextField(
                    controller: _password,
                    autocorrect: true,
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: (kTextFieldBorderColor),
                    style: Fonts.textSize,
                    placeholderStyle: GoogleFonts.oxanium(
                      fontSize: ScreenUtil().setSp(
                          kFontSize, allowFontScalingSelf: true),
                      color: kHintColor,
                    ),
                    placeholder: 'Password',
                    onChanged: (String value) {
                      GlobalVariables.password = value;
                      if ((GlobalVariables.password == '') || (_password.text.length < 6)) {
                        setState(() {
                          btnColor = kTextFieldBorderColor;
                        });
                      } else {
                        setState(() {
                          btnColor = kNavyBlue;
                        });
                      }
                    },
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorder),
                        border: Border.all(color: kNavyBlue)),
                  )
                      : TextFormField(
                    controller: _password,
                    autocorrect: true,
                    autofocus: true,
                    cursorColor: (kTextFieldBorderColor),
                    obscureText: true,
                    style: Fonts.textSize,
                    decoration: Constants.passwordInput,
                    validator: RegValidation.validatePassword,
                    onSaved: (String value) {
                      GlobalVariables.password = value;

                    },

                    onChanged: (String value) {
                      GlobalVariables.password = value;
                      if ((GlobalVariables.password == '') || (_password.text.length < 6)) {
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
          NewBtn(title: kSignUp.toUpperCase(),bgColor:btnColor ,nextFunction: (){_signUpUser();},)

        ],
      ),
    );
  }

  void _signUpUser() {
    //validate form
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
     widget.moveToNext();

    }
  }
  }

