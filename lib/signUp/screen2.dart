import 'package:employee/FormFields/form1.dart';
import 'package:employee/FormFields/form2.dart';
import 'package:employee/FormFields/form3.dart';
import 'package:employee/signUp/screen3.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SignUpScreenTwo extends StatefulWidget {
  @override
  _SignUpScreenTwoState createState() => _SignUpScreenTwoState();
}

class _SignUpScreenTwoState extends State<SignUpScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kAdminSignUp,),
        body: Container(

          child: FormTwo(moveToNext: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreenThree()
    ));},
          )
    )));


  }
}
