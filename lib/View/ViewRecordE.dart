import 'package:attendancesys/Model/Data.dart';
import 'package:attendancesys/View/Widgets/Drawer.dart';
import 'package:attendancesys/View/Widgets/Tiles.dart';
import 'package:flutter/material.dart';



class ViewRecordE extends StatefulWidget {


  const ViewRecordE({Key? key}) : super(key: key);

  @override
  State<ViewRecordE> createState() => _ViewRecordEState();
}
List<AttendanceEntry> userEntries=[];
List<AttendanceEntry> attendanceList = [

];
class _ViewRecordEState extends State<ViewRecordE> {

  @override
  Widget build(BuildContext context) {
    attendanceList=getEntriesForUserID('2001');
    var height=MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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


                     ListView.builder(
                       shrinkWrap: true,
                          itemCount: attendanceList.length,
                          itemBuilder: (ct,i)=>Padding(
                            padding: EdgeInsets.all(width/30),
                            child: AttTile(height: height,width: width,del: false,i: i,attendanceList: attendanceList),
                          )),












                ],
              ),
            ),



          ],
        ),
      )






    );
  }
}
