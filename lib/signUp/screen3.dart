import 'package:employee/FormFields/form3.dart';
import 'package:employee/homePage.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SignUpScreenThree extends StatefulWidget {
  @override
  _SignUpScreenThreeState createState() => _SignUpScreenThreeState();
}

class _SignUpScreenThreeState extends State<SignUpScreenThree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kAdminSignUp,),
        body: Container(

            child: FormThree(moveToNext: (){
            //move the user to home page
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              //set the variables back to null
              setState(() {
                GlobalVariables.loggedInUser = GlobalVariables.fName;
                 GlobalVariables.fName = null;
                 GlobalVariables.lName = null;
                 GlobalVariables.dob = null;
                 GlobalVariables.imageURI = null;
                 GlobalVariables.address = null;
                 GlobalVariables.email = null;
                 GlobalVariables.password =null;
              });
            },)
        )));


  }
}
