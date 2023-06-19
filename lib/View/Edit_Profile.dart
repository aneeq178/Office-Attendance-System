import 'dart:io';

import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}



 File? imagefile;
String imgurl='';





class _EditProfileState extends State<EditProfile> {





  Future getImage()async{
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {


      if (image != null) {
        imgurl=image.path;
        print(imagefile);
        // Use the file as needed
      }

    });
  }



  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
     body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
         children: [
           SizedBox(height: width/10,),



             Container(
                 width: width/5,
                 height: height/10,
                 child: ClipRect(child: Image.file(File(imgurl)))),


           Text_Button(text: "edit photo", ontap: ()async{
         getImage();
           }, width: width),


           Padding(
             padding:  EdgeInsets.all(width/30),
             child: Text_Feild(hinttext: "Name",width: width,),
           ),


         ],
        ),
      ),
    );
  }
}



