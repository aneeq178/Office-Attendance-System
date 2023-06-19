

class AttendanceRecord {
  final String date;
  final String userID;
  final bool attendanceStatus;
  final bool marked;
  int total=0;
  int present=0;

  AttendanceRecord({
    required this.date,
    required this.userID,
    required this.attendanceStatus,
    required this.marked,

  });


  void markAttend() {
    total = (total + 1);
    if(attendanceStatus==true)
      {
        present = (present + 1);
      }

  }

  String calculateGrade() {
    double score = (present! * 100) / total!;
    String grade;

    if (score >= 90 && score <= 100 ) {
      grade = 'A';
    } else if (score >= 80 && score <= 90) {
      grade = 'B';
    } else if (score >= 70 && score <= 90) {
      grade = 'C';
    } else if (score >= 60 && score <= 90) {
      grade = 'D';
    } else {
      grade = 'F';
    }



    return grade;
  }


}





  // Accessing and manipulating the attendanceList as per your requirements
