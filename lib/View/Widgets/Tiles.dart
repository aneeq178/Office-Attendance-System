import 'package:attendancesys/Controller/AttendanceController.dart';
import 'package:attendancesys/Model/Attendance_Data.dart';
import 'package:attendancesys/Model/Data.dart';
import 'package:attendancesys/View/AdminView.dart';
import 'package:attendancesys/View/ViewRecordE.dart';
import 'package:attendancesys/View/Widgets/Text_TextFeilds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class AttTile extends StatelessWidget {
  const AttTile({
    super.key,
    required this.width,
    required this.height,
    required this.del,
    required this.attendanceList,
    required this.i,
    this.ctrl,
    this.check,
    this.id,
  });

  final double width;
  final double height;
  final bool del;
  final int i;
  final List<AttendanceEntry> attendanceList;
  final AttendanceController? ctrl;
  final bool? check;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return check==false?Dismissible(
      key: ValueKey<String>(attendanceList[i].date!),
      onDismissed: (DismissDirection direction) {
        ctrl!.remove(i);
        attendanceList.removeAt(i);
        ctrl!.calculategrade(id!);
      },
      direction: DismissDirection.endToStart,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 40, vertical: width / 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisSize: MainAxisSize.min, children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Heading(text: attendanceList[i].date!, font: 10),
                        SizedBox(width: width/30,),
                        Heading(text: attendanceList[i].status==true?"Present":"Absent", font: 12),
                        SizedBox(width: width/4,),
                        del?IconButton(onPressed: (){}, icon:Icon(Icons.delete_outline_sharp)):Container(),
                      ],
                    ),
                    SizedBox(height: height/80,),



                  ],
                )
              ]),

            ],
          ),
        ),
      ),
    ):Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 40, vertical: width / 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [

              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Heading(text: attendanceList[i].date!, font: 10),
                      SizedBox(width: width/30,),
                      Heading(text: attendanceList[i].status==true?"Present":"Absent", font: 12),
                      SizedBox(width: width/4,),
                      del?IconButton(onPressed: (){}, icon:Icon(Icons.delete_outline_sharp)):Container(),
                    ],
                  ),
                  SizedBox(height: height/80,),



                ],
              )
            ]),

          ],
        ),
      ),
    );
  }
}

class EmployeTile extends StatelessWidget {
  const EmployeTile({
    super.key,
    required this.width,
    required this.height,
    required this.users,
    required this.i,
  });

  final double width;
  final double height;
  final List<Users> users;
  final int i;

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminView(id: users[i].id,)),);},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 40, vertical: width / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg'
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading(text: users[i].name!, font: 12),
                      SizedBox(height: height/80,),

                      Heading(text: users[i].id!, font: 12),
                      SizedBox(height: height/80,),


                      Row(children: [
                        Heading(text:'grade: ', font: 12),
                        Heading(text: users[i].grade!, font: 12)
                      ]),
                      SizedBox(height: height/80,),
                    ],
                  )
                ]),

              ],
            ),
          ),
        ),

    );
  }
}

