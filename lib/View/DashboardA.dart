import 'package:attendancesys/Model/Attendance_Data.dart';
import 'package:attendancesys/Model/Attendance_Model.dart';
import 'package:attendancesys/Model/Data.dart';
import 'package:attendancesys/View/LoginEmp.dart';
import 'package:attendancesys/View/ViewRecordE.dart';
import 'package:attendancesys/View/Widgets/Drawer.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Widgets/Drawer.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:attendancesys/View/Widgets/Tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DashboardA extends StatefulWidget {
  const DashboardA({Key? key}) : super(key: key);

  @override
  State<DashboardA> createState() => _DashboardAState();
}

class _DashboardAState extends State<DashboardA> {
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,title: Text('Dashboard'),),
      drawer: MyDrawer(),
      body:SingleChildScrollView(

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: height/16,),



                  Padding(
                    padding:  EdgeInsets.all(width/30),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: userList.length,
                        shrinkWrap: true,
                        itemBuilder: (ct,i)=>Padding(
                          padding: EdgeInsets.all(width/50),
                          child: EmployeTile(width: width, height: height,i: i,users: userList),
                        )),
                  ),




                ],
              ),
            ),



          ],
        ),








      ),
    );;
  }
}

class Request_Leave extends StatelessWidget {
  const Request_Leave({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('Request for a Leave'),

      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text_Feild(hinttext: 'ID', width: width),
              Text_Feild(hinttext: 'Subject', width: width),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Body',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                maxLines: 3,

              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Discard'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child:  Text('Submit'),
        ),
      ],
    );
  }
}




