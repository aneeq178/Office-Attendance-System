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

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

String user='';

String? id;
// List<Users> userList=[];

 // void getList()
 // {
 //   print("in get");
 //   //Users users=new Users() ;
 //   // userList =users.getUserList();
 //   userList =
 //   [
 //     Users(name: 'Ali', id: '2001', grade: ''),
 //
 //
 //   ];
 //
 // }

List<Users> userList = [

];
checkuser() async
{
  final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
  user=await sharedpreferences.getString('user')!;
  id=await sharedpreferences.getString('id')!;


}

bool marked=false;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {


    userList=getUserList();
    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,title: Text('Dashboard'),),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: height/16,),

                  Button(width: width,text: "Mark Att",ontap: (){

                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat('dd MMMM').format(now);

                    //AttendanceRecord attrec= new AttendanceRecord(date: formattedDate, userID: id!, attendanceStatus:true, marked: true);
                    marked=true;
                   // attrec.markAttend();
                    //attrec.calculateGrade();



                    final snackBar = SnackBar(
                      content: marked==false?Text('Attendance Marked'):Text('Already Marked'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  },height: height),
                  Button(width: width,text: "Mark Leave",ontap: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Request_Leave(width: width),
                    );

                  },height: height),


                  Button(width: width,text: "View",ontap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRecordE()));

                  },height: height),





                ],
              ),
            ),



          ],
        ),
      ),
    );
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




