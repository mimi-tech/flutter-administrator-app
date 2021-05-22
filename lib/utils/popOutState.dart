
import 'dart:convert';

import 'package:employee/utils/admin_header.dart';
import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';


class PopOutState extends StatefulWidget {

  @override
  _PopOutStateState createState() => _PopOutStateState();
}

class _PopOutStateState extends State<PopOutState> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 600),
            curve: Curves.decelerate,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[

                      StickyHeader(
                          header:  AdminHeader(title: 'List of States'.toUpperCase(),),

                          content: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: GlobalVariables.countryState.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      getState(index);
                                    },

                                    child: Card(
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                          children: [
                                            Container(
                                                height:40,
                                                width: 40,
                                                decoration:BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:Colors.blueAccent
                                                ),
                                                child: Center(child: Text(GlobalVariables.countryState[index]['code'], style: GoogleFonts.oxanium(textStyle: Fonts.countryStyle)))),

                                            SizedBox(width: 30,),
                                            Text(GlobalVariables.countryState[index]['name'], style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),

                    ]
                ),
              ),
            ))

    );

  }

  void getState(int index) {
//get the state selected
    setState(() {
      GlobalVariables.selectedCountryState = GlobalVariables.countryState[index]['name'];
      GlobalVariables.selectedStateCode = GlobalVariables.countryState[index]['code'];
      GlobalVariables.state.text = GlobalVariables.selectedCountryState;
    });
    Navigator.pop(context);
  }
}


