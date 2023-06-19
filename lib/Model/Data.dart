import 'package:attendancesys/Model/Attendance_Data.dart';
import 'package:attendancesys/Model/Attendance_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String? name;
  final String? id;
  String? grade;

  Users({
   this.name,
     this.id,
    this.grade,
  });


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'grade': grade,
    };
  }


//   void getGrade()
//   {
//     AttendanceEntry attE= new AttendanceEntry();
// print('in get grade');
//    for (var entry in userList)
//       {
//         entry.grade=attE.calculategrade(entry.id!);
//       }
//   }
//
//   List<Users> getUserList()
//   {
//     getGrade();
//     return userList;
//   }

}

List<Users> getUserList() {
  List<Users> userList = [
    Users(name: 'Ali', id: '2001', grade: ''),
    Users(name: 'Sana', id: '2002', grade: ''),
    Users(name: 'Ahmed', id: '2003', grade: ''),
  ];

  print('In getGrade');
  for (var entry in userList) {
    entry.grade = calculategrade(entry.id!);
    print(entry.grade);
  }
  return userList;
}



class Attendance {
  final String date;
  final String status;

  Attendance({
    required this.date,
    required this.status,
  });
}




///////////////////////////////////////////////////////

class AttendanceEntry {

  final String? date;
  final String? userID;
  bool? status;


  AttendanceEntry({
    this.date,
    this.userID,
    this.status,

  });




}


List<AttendanceEntry> attendanceList = [
  AttendanceEntry(
    date: '2023-06-01',
    userID: '2001',
    status: true,
  ),
  AttendanceEntry(
    date: '2023-06-02',
    userID: '2001',
    status: false,

  ),
  AttendanceEntry(
    date: '2023-06-03',
    userID: '2001',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-04',
    userID: '2001',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-15',
    userID: '2001',
    status: false,

  ),







  ////////////////////////////

  AttendanceEntry(
    date: '2023-06-01',
    userID: '2002',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-02',
    userID: '2002',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-03',
    userID: '2002',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-04',
    userID: '2002',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-05',
    userID: '2002',
    status: false,

  ),
  // Add more entries as needed



  ///////////////////////



  AttendanceEntry(
    date: '2023-06-01',
    userID: '2003',
    status: false,

  ),
  AttendanceEntry(
    date: '2023-06-02',
    userID: '2003',
    status: false,

  ),
  AttendanceEntry(
    date: '2023-06-03',
    userID: '2003',
    status: true,
  ),
  AttendanceEntry(
    date: '2023-06-04',
    userID: '2003',
    status: true,

  ),
  AttendanceEntry(
    date: '2023-06-05',
    userID: '2003',
    status: true,

  ),
];

List<AttendanceEntry> getEntriesForUserID( String userID) {
  List<AttendanceEntry> userEntries = [];

  for (var entry in attendanceList) {
    if (entry.userID == userID) {
      userEntries.add(entry);
    }
  }
  return userEntries;
}

String calculategrade( String userID) {

  print("in grade calculator");
  int presentCount = 0;
  int totalCount = 0;
  String grade;

  for (var entry in attendanceList) {
    if (entry.userID == userID) {
      totalCount++;
      if (entry.status!) {
        presentCount++;
      }
    }

  }

  double score = (presentCount * 100) / totalCount;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  return grade;


}



  // Accessing and manipulating the attendanceList as per your requirements
