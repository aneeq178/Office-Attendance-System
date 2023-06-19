import 'package:attendancesys/Model/Data.dart';
import 'package:flutter/cupertino.dart';

class AttendanceController extends ChangeNotifier{



  List<AttendanceEntry> attendanceList =getEntriesForUserID('2001');
  List<AttendanceEntry> filteredList =[];
  String grade='';

  void update(TextEditingController _date,String _status)
  {
    print(attendanceList.length);
    print('update');
    attendanceList.add(AttendanceEntry(date: _date.text,status: _status=="present"?true:false));
    print(attendanceList.length);
    print(attendanceList.last.date);
    for (var i in attendanceList)
      {print(i.date);print(i.status);}
    notifyListeners();
  }

  void remove(int id)
  {

    attendanceList.removeAt(id);
    notifyListeners();

  }



  void getFilteredList(String startDate, String endDate) {
    final startDateTime = DateTime.parse(startDate);
    final endDateTime = DateTime.parse(endDate);

    for (var entry in attendanceList) {
      final entryDateTime = DateTime.parse(entry.date!);
      if (entryDateTime.isAfter(startDateTime) &&
          entryDateTime.isBefore(endDateTime)) {
        filteredList.add(
            AttendanceEntry(date: entry.date, status: entry.status));
      }
    }
    notifyListeners();
  }

   calculategrade( String userID) {

    print("in grade calculator");
    int presentCount = 0;
    int totalCount = 0;


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

    print(grade);
    notifyListeners();


  }


}