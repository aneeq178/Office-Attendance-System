import 'package:attendancesys/Controller/Login_Controller.dart';
import 'package:attendancesys/Controller/Validators.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:attendancesys/View/DashboardA.dart';
import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




TextEditingController _emailcontrollerl = new TextEditingController();
TextEditingController _passwordcontrollerl = new TextEditingController();
final _formKeyl = GlobalKey<FormState>();



Validators validators = new Validators();
FireStore fireStore = new FireStore();

bool check2=true;

String user='';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {



    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Form(
          key: _formKeyl,
          child: Column(
            children: [
              SizedBox(height: height/16,),
              Heading(text: "Log In", font: 20),
              SizedBox(height: height/6,),


              Text_Feild(hinttext: "Email",width: width,controller: _emailcontrollerl, validate: (a) => validators.validateEmail(a!),),
              Text_Feild(hinttext:  "Password",width: width,controller: _passwordcontrollerl,  validate: (a) => validators.validatePassword(a!),),




              Button(text: 'Sign In',width: width,height: height,ontap: () async{



                  if(_emailcontrollerl.text.toString()=="admin")
                    {
                      print("valid");
                      final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
                      sharedpreferences.setString('email', _emailcontrollerl.text);
                      sharedpreferences.setString('user', 'admin');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DashboardA()),
                      );

                    }
                  else{




                    print('wrog');
                  }




              },)



            ],
          ),
        ),
      ),

    );
  }
}
