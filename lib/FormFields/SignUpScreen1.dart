import 'dart:io';


import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/popOutCountry.dart';
import 'package:employee/utils/regConst.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_country_state/flutter_country_state.dart';


import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _state = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color btnColor = kTextFieldBorderColor;
  final picker = ImagePicker();
  String fName = '';
  String lName = '';
  String dob = '';
  String address = '';
  String country = '';
  String state = '';

  File imageURI;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imageURI = File(pickedFile.path);
        _cropImage(imageURI.path, imageURI);

      } else {
        print('No image selected.');
      }
    });
  }





  Future getImageFromGallery() async {

    File file = await FilePicker.getFile(
      type: FileType.image,

    );

    // int fileSize = file.lengthSync();
    _cropImage(file.path, file);

  }

  _cropImage(filePath, File file) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1000,
        maxHeight: 1000,
        compressQuality: 20,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Photo',
            toolbarColor: kWhiteColor,
            toolbarWidgetColor: kNavyBlue,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
//check if user actually cropped the image
    if (croppedImage  != null) {

      setState(() {
        imageURI  = croppedImage;


      });
    }else{
      setState(() {
        imageURI  = file;


      });
    }
  }

  List gender=["Male","Female","Other"];

  String select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value){
            setState(() {
              print(value);
              select=value;
            });
          },
        ),
        Text(title, style: GoogleFonts.oxanium(textStyle: Fonts.textSize)),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppbar(title: kAdminSignUp,),
        body: SingleChildScrollView(
            child: Column(

            children: <Widget>[
            spacer(),

        Center(child:
        imageURI == null? Container(
          height: 80,
          width: 80,
        decoration: BoxDecoration(
          color: kTextFieldBorderColor,
          shape: BoxShape.circle
        ),
        child: IconButton(icon: Icon(Icons.person), onPressed: (){getImageFromGallery();},color: kWhiteColor,)

        )

            : GestureDetector(
        onTap: (){

        getImageFromGallery();
        },
        child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: FileImage(imageURI),
        radius: 50,

        ),
        )

        )


        ,

        Text( imageURI == null? kProfilePix:'Edit photo',
        style:GoogleFonts.oxanium(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
        color: imageURI == null?  kPix:kRedColor,
        ),
        ),



/*showing the textField*/
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kName, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),
                        Platform.isIOS
                            ? CupertinoTextField(
                          controller: _fName,
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
                          placeholder: kFName,
                          onChanged: (String value) {
                            fName = value;
                          },
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorder),
                              border: Border.all(color: kNavyBlue)),

                        )
                            : TextFormField(
                          controller: _fName,
                          autocorrect: true,
                          autofocus: true,
                          cursorColor: (kTextFieldBorderColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          style: Fonts.textSize,
                          decoration: Constants.firstNameInput,
                          validator: RegValidation.validateFName,
                          onSaved: (String value) {
                            fName = value;
                            },
                        ),
                             spacer(),
                        ///displaying last name
                  Text(klName, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),
                        Platform.isIOS
                            ? CupertinoTextField(
                          controller: _lName,
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
                          placeholder: kFName,
                          onChanged: (String value) {
                            lName = value;

                          },
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorder),
                              border: Border.all(color: kNavyBlue)),

                        )
                            : TextFormField(
                          controller: _lName,
                          autocorrect: true,
                          autofocus: true,
                          cursorColor: (kTextFieldBorderColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          style: Fonts.textSize,
                          decoration: Constants.lastNameInput,
                          validator: RegValidation.validateLName,
                          onSaved: (String value) {
                            lName = value;

                          },
                        ),




                   spacer(),


                  ///displaying the gender field

                   Text(kGender, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),
                 Row(
                    children: <Widget>[
                      addRadioButton(0, 'Male'),
                      addRadioButton(1, 'Female'),
                      addRadioButton(2, 'Others'),
                    ],
                  ),

                  ///display calendar for date of birth
                  spacer(),
                  Text(kDob, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),

                  Platform.isIOS
                      ? GestureDetector(
                    onTap: (){
                      selectDob(context);

                    },
                        child: AbsorbPointer(
                          child: CupertinoTextField(
                    controller: _dob,
                    autocorrect: true,
                    autofocus: true,

                    cursorColor: (kTextFieldBorderColor),
                    style: Fonts.textSize,
                    placeholderStyle:GoogleFonts.oxanium(
                          fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
                          color: kHintColor,
                    ),
                    placeholder: 'Date of birth',
                    onChanged: (String value) {
                                dob = value;
                    },
                    decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorder),
                            border: Border.all(color: kNavyBlue)),
                  ),
                        ),
                      )
                      : GestureDetector(
                    onTap: (){
                     selectDob(context);

                    },
                        child: AbsorbPointer(

                          child: TextFormField(

                    controller: _dob,
                    autocorrect: true,
                    autofocus: true,
                    cursorColor: (kTextFieldBorderColor),

                    style: Fonts.textSize,
                    decoration: Constants.dobInput,
                            validator: RegValidation.validateDob,
                    onSaved: (String value) {
                           dob = value;

                          },
                  ),
                        ),
                      ),


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
                      address = value;

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
                      address = value;

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
                    controller: _country,
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
                      getCountry();
                    },
                        child: AbsorbPointer(
                          child: TextFormField(
                    controller: _country,
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
                        controller: _state,
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
                        controller: _state,
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
                      ),
                    ),
                  ),




                  spacer(),


                ],
              ),
            ),
          ),



        spacer(),


        NewBtn(nextFunction: (){moveToNext();}, bgColor: btnColor,title: 'Sign up')


        ])),
      ),
    );
  }

  void moveToNext() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();


    }
  }

   Future<void> selectDob(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(1920),
        lastDate: DateTime(2090),
        helpText: 'Select date of birth',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter date in valid range',
        fieldLabelText: 'Issued date',
        fieldHintText: 'Month/Date/Year',


        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.dark(
                primary: kOrangeColor,
                onPrimary: Colors.white,
                surface: kOrangeColor,
                onSurface: kBlackColor,


              ),
              dialogBackgroundColor: kWhiteColor,
            ),
            child: child,
          );
        }

    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dob.text = "${selectedDate.toLocal()}".split(' ')[0];

      });
  }



  void getCountry(){
    showDialog(
        context: context,
        child: Container(
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 4,
            children: <Widget>[
              Column(
                children: <Widget>[
                  PopOut(),
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: SingleChildScrollView(
                        child: Container(
                            child: ShowMyDialog(
                              fontSize: ScreenUtil().setSp(kFontSize),
                              textColors: kHintColor,
                              searchHint: 'Search country',
                              substringBackground: kBlackColor,
                              //substringFontSize: ScreenUtil().setSp(22),

                            ))

                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void getState(){
    showDialog(
        context: context,
        child:  SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          elevation: 4,
          children: <Widget>[
            PopOut(),

            SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.7,
                child:SingleChildScrollView(
                  child: StateDialog(
                    fontSize: ScreenUtil().setSp(kFontSize),
                    textColors: kHintColor,
                    substringFontSize: ScreenUtil().setSp(22),
                    substringBackground: kBlackColor,
                  ),
                ),),)

          ],

        )
    );
  }
  }

