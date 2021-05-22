import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/search.dart';
import 'package:employee/utils/view_construct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ViewEmployees extends StatefulWidget {
  @override
  _ViewEmployeesState createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> {

  String filter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GlobalVariables.searchController.addListener(() {
      setState(() {
        filter = GlobalVariables.searchController.text;
      });
    });

  }

  Widget bodyList(int index){
    return TxnConstruction(
      address: GlobalVariables.emAddress[index],
      fName: GlobalVariables.emFName[index],
      lName: GlobalVariables.emLName[index],
      dob: GlobalVariables.emDob[index],
      passport: GlobalVariables.emPassport[index],
      state: GlobalVariables.emState[index],
      country: GlobalVariables.emCountry[index],
      gender:  GlobalVariables.emGender[index],
      designation:  GlobalVariables.emDesignation[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchAppBar(title: 'All Employees'.toUpperCase(),),
        body: SingleChildScrollView(child: Container(

          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount:  GlobalVariables.emFName.length,
        itemBuilder: (context, int index) {

          return filter == null || filter == "" ?bodyList(index):
          '${ GlobalVariables.emFName[index]}'.toLowerCase()
              .contains(filter.toLowerCase())

              ?bodyList(index):Container(child: Text('No employee found'),);

        }
        ))),
      ),
    );
  }
}
