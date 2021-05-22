
import 'package:employee/Admin/employee_screen_three.dart';
import 'package:employee/FormFields/form2.dart';

import 'package:employee/signUp/screen3.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class EmployeeScreenTwo extends StatefulWidget {
  @override
  _EmployeeScreenTwoState createState() => _EmployeeScreenTwoState();
}

class _EmployeeScreenTwoState extends State<EmployeeScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kEmployeeSignUp,),

        body: Container(

            child: FormTwo(moveToNext: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreenThree()
            ));},
            )
        )));


  }
}
