
import 'package:employee/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
class RegText extends StatefulWidget {
  RegText({@required this.title});
  final String title;
  @override
  _RegTextState createState() => _RegTextState();
}

class _RegTextState extends State<RegText>with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _offsetFloat;


  @override
  void initState() {
    super.initState();

    //ToDo:second animation
    _controller = AnimationController(
      vsync:this,
      value: 0.1,
      duration: const Duration(seconds: 1),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _offsetFloat.addListener((){
      setState((){});
    });
    _controller.forward();



  }
  @override
  void dispose() {
    // Don't forget to dispose the animation controller on class destruction

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: SlideTransition(
        position: _offsetFloat,
        child: Text(widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.oxanium(textStyle: Fonts.textSize)),
      ),
    );
  }
}


class SignUpTitle extends StatefulWidget {
  SignUpTitle({@required this.title});
  final String title;
  @override
  _SignUpTitleState createState() => _SignUpTitleState();
}

class _SignUpTitleState extends State<SignUpTitle> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<Offset> _offsetFloat;


  @override
  void initState() {
    super.initState();

    //ToDo:second animation
    _controller = AnimationController(
      vsync:this,
      value: 0.1,
      duration: const Duration(seconds: 1),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _offsetFloat.addListener((){
      setState((){});
    });
    _controller.forward();

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: SlideTransition(
        position: _offsetFloat,
        child: Text(widget.title,
            style: GoogleFonts.oxanium(textStyle: Fonts.textSize)),
      ),
    );
  }
}
