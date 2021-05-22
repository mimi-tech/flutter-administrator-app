
import 'package:employee/FormFields/form4.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/strings.dart';
import 'package:employee/view_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class EmployeeScreenThree extends StatefulWidget {
  @override
  _EmployeeScreenThreeState createState() => _EmployeeScreenThreeState();
}

class _EmployeeScreenThreeState extends State<EmployeeScreenThree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: HomeAppbar(title: kEmployeeSignUp,),

        body: Container(

            child: FormFour(moveToNext: (){
              //add the employee to list
              setState(() {
                GlobalVariables.emFName.add(GlobalVariables.fName);
                GlobalVariables.emLName.add(GlobalVariables.lName);
                GlobalVariables.emCountry.add(GlobalVariables.selectedCountryName);
                GlobalVariables.emDob.add(GlobalVariables.dob);
                GlobalVariables.emPassport.add(GlobalVariables.imageURI);
                GlobalVariables.emAddress.add(GlobalVariables.address);
                GlobalVariables.emState.add(GlobalVariables.selectedCountryState);
                GlobalVariables.emDesignation.add(GlobalVariables.designation);
                GlobalVariables.emGender.add(GlobalVariables.gender);
              });


              GlobalVariables.notifyFlutterToastSuccess(title: 'Employee created successfully');
              //move the user to view screen
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewEmployees()));
              //set the variables back to null

            },)
        )));


  }
}
