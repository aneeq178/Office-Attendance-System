import 'package:attendancesys/Controller/Login_Controller.dart';
import 'package:attendancesys/Controller/Validators.dart';
import 'package:attendancesys/View/Login.dart';
import 'package:attendancesys/View/Signup.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:flutter/material.dart';
import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';




Validators validators = new Validators();
 FireStore fireStore = new FireStore();
 bool check1=false;


TextEditingController _namecontroller = new TextEditingController();
TextEditingController _id = new TextEditingController();
TextEditingController _emailcontroller = new TextEditingController();
TextEditingController _passwordcontroller = new TextEditingController();
final _formKey = GlobalKey<FormState>();


class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return Scaffold(
      body:  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height/16,),
              Heading(text: "Sign Up", font: 20),
              SizedBox(height: height/6,),
              Form(
                  key:_formKey,
                  child: Column(

                children: [




                  Text_Feild(hinttext: "Name",width: width,controller: _namecontroller,validate: (a) => validators.validatename(a!),),
                  Text_Feild(hinttext: "ID",width: width,controller: _id,validate:  (a) => validators.validatename(a!),),
                  Text_Feild(hinttext: "Email",width: width,controller: _emailcontroller, validate: (a) => validators.validateEmail(a!),),
                  Text_Feild(hinttext:  "Password",width: width,controller: _passwordcontroller,  validate: (a) => validators.validatePassword(a!),),

                ],
              )),

              Align(
                alignment: Alignment.centerRight,
                child: Text_Button(text: 'Already Signed In?',width: width,ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                }),
              ),

              Button(text: 'Sign UP',width: width,height: height,ontap: ()async{
                if (_formKey.currentState!.validate()) {

                  check1=await fireStore.Auth( email: _emailcontroller.text, password: _passwordcontroller.text);

                  fireStore.CreateUser(name: _namecontroller.text, id: _id.text.toString(), email: _emailcontroller.text, password: _passwordcontroller.text);


                  if (check1!=false)
                    {
                      final snackBar = SnackBar(
                        content: Text('Signed Up!'),

                      );
                      final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
                      sharedpreferences.setString('user', 'emp');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard()),

                      );
                    }






                }


              },),



              ],
          ),
        ),

    );
  }
}

