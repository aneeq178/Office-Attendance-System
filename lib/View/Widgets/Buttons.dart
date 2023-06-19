import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class Button extends StatelessWidget {
  Button({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.ontap
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(width/20),
      child: GestureDetector(
        onTap: ontap,

        child: Container(

          width: width/2.4,
          height: height/12,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(width/10))
          ),

          child: Align(

              alignment: Alignment.center,
              child: Text(text,style:TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}


class Text_Button extends StatelessWidget {
  Text_Button({
    super.key,

    required this.text,
    required this.ontap,
    required this.width,
  });

  final double width;
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(width/20),
      child: GestureDetector(
        onTap: ontap,

        child: Text(text,style: TextStyle(color: Colors.indigo,fontSize: 12.sp),),
      ),
    );
  }
}