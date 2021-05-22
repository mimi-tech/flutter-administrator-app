import 'dart:convert';
import 'dart:io';

import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/popOutState.dart';
import 'package:employee/utils/tab_construct.dart';
import 'package:http/http.dart' as http;

import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/popOutCountry.dart';
import 'package:employee/utils/regConst.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class FormTwo extends StatefulWidget {
  FormTwo({@required this.moveToNext});
  final Function moveToNext;
  @override
  _FormTwoState createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  TextEditingController _address = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Color btnColor = kTextFieldBorderColor;

  String country = '';
  String state = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountry();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          child: Column(
            children: [
              spacer(),


              TabConstruct(),

    Form(
    key: _formKey,
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ///displaying address
      spacer(),
      Text(kAddress, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

      Platform.isIOS
          ? CupertinoTextField(
        controller: _address,
        autocorrect: true,
        autofocus: true,
        maxLength: null,
        keyboardType: TextInputType.streetAddress,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: (kTextFieldBorderColor),
        style: Fonts.textSize,
        placeholderStyle:GoogleFonts.oxanium(
          fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
          color: kHintColor,
        ),
        placeholder: kAddress,
        onChanged: (String value) {
          GlobalVariables.address = value;

        },
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorder),
            border: Border.all(color: kNavyBlue)),
      )
          : TextFormField(
        controller: _address,
        autocorrect: true,
        autofocus: true,
        cursorColor: (kTextFieldBorderColor),
        keyboardType: TextInputType.streetAddress,
        textCapitalization: TextCapitalization.sentences,
        style: Fonts.textSize,
        decoration: Constants.addressInput,
        validator: RegValidation.validateAddress,
        onSaved: (String value) {
          GlobalVariables.address = value;
          //check if the user has input any character inorder to change the color of the next button
          if  (GlobalVariables.address == null) {
            setState(() {
              btnColor = kTextFieldBorderColor;
            });
          } else {
            setState(() {
              btnColor = kNavyBlue;
            });
          }
        },
      ),




      spacer(),
      Text(kCountry, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),


      ///displaying the country

      Platform.isIOS
          ? GestureDetector(
        onTap: (){
          getCountry();
        },
        child: AbsorbPointer(
          child: CupertinoTextField(
            controller: GlobalVariables.country,
            autocorrect: true,
            autofocus: true,

            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: (kTextFieldBorderColor),
            style: Fonts.textSize,
            placeholderStyle:GoogleFonts.oxanium(
              fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
              color: kHintColor,
            ),
            placeholder: kAddress,
            onChanged: (String value) {
              country = value;

            },
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorder),
                border: Border.all(color: kNavyBlue)),
          ),
        ),
      )
          : GestureDetector(
        onTap: (){
          getCountryList();
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: GlobalVariables.country,
            autocorrect: true,
            autofocus: true,
            cursorColor: (kTextFieldBorderColor),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            style: Fonts.textSize,
            decoration: Constants.countryInput,
            validator: RegValidation.validateCountry,
            onSaved: (String value) {
              country = value;

            },
          ),
        ),
      ),




      spacer(),
      Text(kState, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

      ///displaying the states based on the country selected
      Platform.isIOS
          ? GestureDetector(
        onTap: (){
          getState();
        },
        child: AbsorbPointer(
          child: CupertinoTextField(
            controller: GlobalVariables.state,
            autocorrect: true,
            autofocus: true,

            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            cursorColor: (kTextFieldBorderColor),
            style: Fonts.textSize,
            placeholderStyle:GoogleFonts.oxanium(
              fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
              color: kHintColor,
            ),
            placeholder: kAddress,
            onChanged: (String value) {
              state = value;

            },
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorder),
                border: Border.all(color: kNavyBlue)),
          ),
        ),
      )
          : GestureDetector(
        onTap: (){
          getState();
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: GlobalVariables.state,
            autocorrect: true,
            autofocus: true,
            cursorColor: (kTextFieldBorderColor),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            style: Fonts.textSize,
            decoration: Constants.stateInput,
            validator: RegValidation.validateState,
            onSaved: (String value) {
              state = value;
            },
            onChanged: (String value) {
              state = value;
              //check if the user has input any character inorder to change the color of the next button
              if  (state == '') {
                setState(() {
                  btnColor = kTextFieldBorderColor;
                });
              } else {
                setState(() {
                  btnColor = kNavyBlue;
                });
              }
            },
          ),
        ),
      ),





    ]
    ))),
              spacer(),
              NewBtn(nextFunction: (){moveToNext();}, bgColor: btnColor,title: kNext)


            ],
          ),
        );
  }

  void moveToNext() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      widget.moveToNext();

    }
  }



  Future<void> getCountry() async {
    //get the list of countries, states and code
    String url = "https://api.printful.com/countries";

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {

      final Map<String, dynamic> jsonDecoded = json.decode(res.body);

      var countries = jsonDecoded['result'];


          //iterate over the list

      for (var item in countries){
        Map myMap = item;
        GlobalVariables.myMap = item;

        setState(() {
          GlobalVariables.countryName.add(myMap['name']);
          GlobalVariables.countryCode.add(myMap['code']);
          if(myMap['states'] != null){
            GlobalVariables.countryState.addAll(myMap['states']);
          }


        });

      }


    }
  }

  void getState(){
    //check if user has selected any country
    if(GlobalVariables.selectedCountryName == null){
      GlobalVariables.notifyFlutterToastError(title: 'Please select your country first');
    }else{

//show a bottom modal displaying list of states based on selected country

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => PopOutState()
    );
  }}


  void getCountryList() {

//show a bottom modal displaying list of countries fetched from the api

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
   showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => PopOut()
    );
  }
}
