import 'dart:math';

import 'package:attendancesys/Controller/AttendanceController.dart';
import 'package:attendancesys/Model/Data.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:attendancesys/View/ViewRecordE.dart';
import 'package:attendancesys/View/Widgets/Buttons.dart';
import 'package:attendancesys/View/Widgets/Drawer.dart';
import 'package:attendancesys/View/Widgets/Tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKeyy = GlobalKey<FormState>();
final _formKeyyy = GlobalKey<FormState>();
List<AttendanceEntry> userEntries=[];
List<AttendanceEntry> attendanceList = [

];
TextEditingController _date = new TextEditingController();
TextEditingController _status = new TextEditingController();
TextEditingController _SDatae = new TextEditingController();
TextEditingController _Edate = new TextEditingController();


class AdminView extends StatefulWidget {
  final  id;
  const AdminView({Key? key,required this.id}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}



AttendanceController attendanceController= new AttendanceController();
class _AdminViewState extends State<AdminView> {
AttendanceController attendanceController= new AttendanceController();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Random random = Random();
    int randomNumber = random.nextInt(3) + 3;

    var ctrl= Provider.of<AttendanceController>(context,listen: true);
ctrl.grade;

    return  Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,title: Text('Attendance Record'),),
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
                    Padding(
                      padding: EdgeInsets.only(left: width/20),
                      child: Consumer<AttendanceController>(
                        builder: (context,provider,child)=> Row(children: [
                          Text("Grade: "),
                          Text(provider.grade),
                        ],)
                      ),
                    ),
                    SizedBox(height: height/16,),
                    Padding(
                      padding:  EdgeInsets.only(left:width/20),
                      child: Row(children: [
                        Text("Leaves: "),
                        Text(randomNumber.toString()),
                      ],),
                    ),
                    SizedBox(height: height/16,),
                    Form(
                      key: _formKeyy,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width:width/3,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[100],
                          ),
                          child: TextFormField(

                            autofocus: false,
                            controller:_date,
                            decoration: InputDecoration(
                              hintText: "Date",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            ),
                          ),
                        ),

                          Container(
                            width:width/3,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[100],
                            ),
                            child: TextFormField(

                              autofocus: false,
                              controller:_status,
                              decoration: InputDecoration(
                                hintText: "status",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Button(width: width,height: height,text: "Add Record",ontap: (){

                      ctrl.update(_date, _status.text.toString());
                      ctrl.calculategrade(widget.id!);
                    }),

                    Consumer<AttendanceController>(
                            builder: (context,provider,child)=> ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.attendanceList.length,
                                itemBuilder: (ct,i)=>Padding(
                                  padding: EdgeInsets.all(width/30),
                                  child:AttTile(height: height,width: width,del: false,i: i,attendanceList: provider.attendanceList,ctrl: ctrl,check: false,id: widget.id,),

                                )),
                          ),

                    Form(
                      key: _formKeyyy,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width:width/3,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[100],
                            ),
                            child: TextFormField(

                              autofocus: false,
                              controller:_SDatae,
                              decoration: InputDecoration(
                                hintText: "Start Date",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),

                          Container(
                            width:width/3,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[100],
                            ),
                            child: TextFormField(

                              autofocus: false,
                              controller:_Edate,
                              decoration: InputDecoration(
                                hintText: "End Date",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Button(width: width,height: height,text: "Show Report",ontap: (){

                      ctrl.getFilteredList(_SDatae.text, _Edate.text);
                    }),

                    Consumer<AttendanceController>(

                      builder: (context,provider,child)=> ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provider.filteredList.length,
                          itemBuilder: (ct,i)=>Padding(
                            padding: EdgeInsets.all(width/30),
                            child:AttTile(height: height,width: width,del: false,i: i,attendanceList: provider.filteredList,ctrl: ctrl,check: true,),

                          )),
                    ),






                  ],
                ),
              ),



            ],
          ),
        )






    );
  }
}

