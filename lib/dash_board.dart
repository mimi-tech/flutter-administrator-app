import 'package:employee/Admin/employee_screen_one.dart';
import 'package:employee/homePage.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/strings.dart';
import 'package:employee/utils/tab_construct.dart';
import 'package:employee/view_employee.dart';
import 'package:flutter/material.dart';


class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kNavyBlue,
          bottom: TabBar(
            tabs: [
              Tab( text: kHome),
              Tab( text: kCreate),
              Tab( text: kView),
            ],
          ),
          title: TabConstruct(),


        ),
        body: TabBarView(
          children: [
            HomePage(),
            EmployeeScreenOne(),
            ViewEmployees(),
          ],
        ),
      ),
    );
  }
}
