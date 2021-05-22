import 'dart:io';


import 'package:employee/FormFields/form2.dart';
import 'package:employee/utils/btn.dart';
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:employee/utils/home_appbar.dart';
import 'package:employee/utils/regConst.dart';
import 'package:employee/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
class FormOne extends StatefulWidget {
  FormOne({@required this.moveToNext});
  final Function moveToNext;

  @override
  _FormOneState createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _dob = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Color btnColor = kTextFieldBorderColor;
  final picker = ImagePicker();
 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        GlobalVariables.imageURI = File(pickedFile.path);
        _cropImage(GlobalVariables.imageURI.path, GlobalVariables.imageURI);

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
        GlobalVariables.imageURI  = croppedImage;


      });
    }else{
      setState(() {
        GlobalVariables.imageURI  = file;


      });
    }
  }

  List gender=["Male","Female"];

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
              GlobalVariables.gender = value;
            });
          },
        ),
        Text(title, style: GoogleFonts.oxanium(textStyle: Fonts.textSize)),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
    spacer(),

    Center(child:
    GlobalVariables.imageURI == null? Container(
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
    backgroundImage: FileImage(GlobalVariables.imageURI),
    radius: 50,

    ),
    )

    )


    ,

    Text( GlobalVariables.imageURI == null? kProfilePix:'Edit photo',
    style:GoogleFonts.oxanium(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: GlobalVariables.imageURI == null?  kPix:kRedColor,
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
      GlobalVariables.fName = value;
    },
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(kBorder),
    border: Border.all(color: kNavyBlue)),

    )
        : TextFormField(
    controller: _fName,
    autocorrect: true,

    cursorColor: (kTextFieldBorderColor),
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.sentences,
    style: Fonts.textSize,
    decoration: Constants.firstNameInput,
    validator: RegValidation.validateFName,
    onSaved: (String value) {
      GlobalVariables.fName = value;
    },
    ),
    spacer(),
    ///displaying last name
    Text(klName, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),
    Platform.isIOS
    ? CupertinoTextField(
    controller: _lName,
    autocorrect: true,
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
      GlobalVariables.lName = value;

    },
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(kBorder),
    border: Border.all(color: kNavyBlue)),

    )
        : TextFormField(
    controller: _lName,
    autocorrect: true,
    cursorColor: (kTextFieldBorderColor),
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.sentences,
    style: Fonts.textSize,
    decoration: Constants.lastNameInput,
    validator: RegValidation.validateLName,
    onSaved: (String value) {
      GlobalVariables.lName = value;

    },
    ),




    spacer(),


    ///displaying the gender field

    Text(kGender, style: GoogleFonts.oxanium(textStyle: Fonts.titleSize)),
    Row(
    children: <Widget>[
    addRadioButton(0, 'Male'),
    addRadioButton(1, 'Female'),

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

    cursorColor: (kTextFieldBorderColor),
    style: Fonts.textSize,
    placeholderStyle:GoogleFonts.oxanium(
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kHintColor,
    ),
    placeholder: 'Date of birth',
    onChanged: (String value) {
      GlobalVariables.dob = value;
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

    cursorColor: (kTextFieldBorderColor),

    style: Fonts.textSize,
    decoration: Constants.dobInput,
    validator: RegValidation.validateDob,
    onSaved: (String value) {
      GlobalVariables.dob = value;
    },

    ),
    ),
    ),


    ],
      ),

    )),


          spacer(),


          NewBtn(nextFunction: (){moveToNext();}, bgColor: btnColor,title: kNext)


        ]));

  }

  void moveToNext() {
    //check if form is not empty
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      //check if user added passport

      if(GlobalVariables.imageURI == null){
        GlobalVariables.notifyFlutterToastError(title: 'Please add passport');
        //check if user selected gender

      }else if (GlobalVariables.gender == null){
        GlobalVariables.notifyFlutterToastError(title: 'Please Select gender');

      }else{
        //Move to the next screen
        widget.moveToNext();

      }

    }
  }

  Future<void> selectDob(BuildContext context) async {
    //remove the keyboard if active
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    //This will show calendar

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

}
