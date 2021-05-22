import 'file:///C:/Users/Home/AndroidStudioProjects/employee/lib/loginScreen.dart';
import 'package:employee/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Sets the statusBar colour of the app */
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kNavyBlue,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      /* Removes the debug banner at the extreme right of the app */
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
