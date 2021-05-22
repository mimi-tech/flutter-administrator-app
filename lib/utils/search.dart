
import 'package:employee/utils/colors.dart';
import 'package:employee/utils/constants.dart';
import 'package:employee/utils/dimens.dart';
import 'package:employee/utils/fonts.dart';
import 'package:employee/utils/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{
  SearchAppBar({@required this. title});
  final String title;
  @override
  _RemovedAppBarState createState() => _RemovedAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);

}

class _RemovedAppBarState extends State<SearchAppBar> {
  Icon actionIcon =  Icon(Icons.search,color: Colors.grey,size: 25,);
  bool checkSearch = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: kNavyBlue,
      title:checkSearch ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.title.toUpperCase(),
            style:GoogleFonts.oxanium(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
              color: kWhiteColor,
            ),
          ),


          GestureDetector(
              onTap: (){
                setState(() {
                  checkSearch = false;
                });
              },
              child: Icon(Icons.search,color: Colors.grey,size: 25,))


        ],
      ):Container(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(
              child: TextFormField(
                  controller: GlobalVariables.searchController,
                  style: Fonts.textSize,
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: kBlackColor,
                  keyboardType: TextInputType.text,
                  decoration: Constants.searchInput),
            ),

            GestureDetector(
                onTap: (){
                  setState(() {
                    checkSearch = true;
                  });
                },
                child: Icon(Icons.clear,color: Colors.grey,size: 25,))
          ],
        ),
      ),
    );
  }
}
