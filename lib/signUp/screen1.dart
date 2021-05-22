import 'package:employee/FormFields/form1.dart';
import 'package:employee/FormFields/form2.dart';
import 'package:employee/signUp/screen2.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SignUpScreenOne extends StatefulWidget {
  @override
  _SignUpScreenOneState createState() => _SignUpScreenOneState();
}

class _SignUpScreenOneState extends State<SignUpScreenOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kAdminSignUp,),
        body: Container(

      child: FormOne(moveToNext: (){

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreenTwo()));

      },),
    )));
  }
}
