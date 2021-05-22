import 'package:employee/Admin/employee_screen_two.dart';
import 'package:employee/FormFields/form1.dart';
import 'package:employee/FormFields/form2.dart';
import 'package:employee/signUp/screen2.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class EmployeeScreenOne extends StatefulWidget {
  @override
  _EmployeeScreenOneState createState() => _EmployeeScreenOneState();
}

class _EmployeeScreenOneState extends State<EmployeeScreenOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kEmployeeSignUp,),
        body: Container(

          child: FormOne(moveToNext: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreenTwo()));},),
        )));
  }
}
