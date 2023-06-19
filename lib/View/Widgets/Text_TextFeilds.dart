import 'package:attendancesys/Controller/Validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Heading extends StatelessWidget {
  Heading({
    super.key,
    required this.text,
    required this.font,

  });

  String text;
  int font;


  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize:font.sp),);
  }
}

class Text_Feild extends StatelessWidget {
  Text_Feild({
    required this.hinttext,
    this.validate,
   this.controller,
    required this.width,
    super.key,
  });

  String hinttext;
  TextEditingController? controller;
  final String? Function(String? a)? validate;
  double width;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(width/30),
      child:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
        ),
        child: TextFormField(
autofocus: false,
          controller: controller,
          validator: validate,
          decoration: InputDecoration(

            border: InputBorder.none,
            hintText: hinttext,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ),
    );
  }
}
