import 'package:attendancesys/View/Login.dart';
import 'package:attendancesys/View/LoginEmp.dart';
import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Signup.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreenState2();
}


class _SplashScreenState2 extends State<SplashScreen2> {


  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Center(
        child: SingleChildScrollView(

          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height/16,),
                Heading( text: 'Welcome to EZ Line',font: 20,),
                SizedBox(height: height/3,),

                Heading( text: 'I am an?',font: 18),

                      
                      Button(width: width, height: height,text:'Admin',ontap:() async {

                        final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
                        sharedpreferences.setString('user', 'admin');

                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()),
                      );}),
                      Button(width: width, height: height,text:'Employee',ontap: () async {

                        final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
                        sharedpreferences.setString('user', 'emp');


                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginEmp()),
                      );},),
                

                      SizedBox(width: width/5,),

                   


              ],
            ),
          ),
        ),
      ),
    );
  }
}



