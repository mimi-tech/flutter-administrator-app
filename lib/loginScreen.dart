
import 'dart:io';

import 'package:employee/FormFields/form1.dart';
import 'package:employee/dash_board.dart';
import 'package:employee/homePage.dart';
import 'package:employee/signUp/screen1.dart';
import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/regConst.dart';
import 'package:employee/utils/regText.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color btnColor = kTextFieldBorderColor;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _publishModal = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: HomeAppbar(title: kTitle,),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[

            RegText(title: kLoginHint),
            spacer(),

            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: kHorizontal),
                      child: Platform.isIOS
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
                          email = value;

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
                            email = value;
                        },
                      )),

                  spacer(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: kHorizontal),
                      child: Platform.isIOS
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
                          password = value;
                          if ((password == '') || (_password.text.length < 6)) {
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
                          password = value;
                          if ((password == '') || (_password.text.length < 6)) {
                            setState(() {
                              btnColor = kTextFieldBorderColor;
                            });
                          } else {
                            setState(() {
                              btnColor = kNavyBlue;
                            });
                          }
                        },
                      )),

                ],
              ),
            ),



            /*displaying Next button*/
            spacer(),
            GestureDetector(

                onTap: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreenOne()));
                },
                child: RichText(

                  text: TextSpan(text: '$kLoginText2 ',
                      style: GoogleFonts.oxanium(
                        fontSize: ScreenUtil().setSp(
                            kFontSize, allowFontScalingSelf: true),
                        color: kBlackColor,
                      ),

                      children: <TextSpan>[
                        TextSpan(
                          text: kSignUp,
                          style: GoogleFonts.pacifico(
                            fontSize: ScreenUtil().setSp(
                                kFontSize, allowFontScalingSelf: true),
                            color: kNavyBlue,
                          ),
                        ),
                      ]
                  ),


                )),
            spacer(),
            NewBtn(title: 'Login',bgColor:btnColor ,nextFunction: (){_loginUser();},)

          ],
        ),
      ),
    );
  }

  void _loginUser() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      //just let the user in after validating the form
      setState(() {
        GlobalVariables.loggedInUser = _email.text;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

    }
  }
}
