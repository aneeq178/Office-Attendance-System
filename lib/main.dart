import 'dart:async';
import 'package:attendancesys/Controller/AttendanceController.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'View/SplashScreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AttendanceController()),
      ],
      child:      MyApp()) ,);

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
String finalemail='';
class _MyAppState extends State<MyApp> {




Future getValidationData()async
{
  final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  var email= sharedPreferences.getString('email');

  setState(() {
    finalemail=email!;
  });
}

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(  home: SplashScreen(),);
        }
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();




    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>finalemail==null? SplashScreen2():Dashboard()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
          child: FadeTransition(
              opacity: _animation,
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfJgCwpKYCAnjn2h1Yko90xxVggOzbunsy-T8bX8qOparPwdztRA_rqFCxpjNh9KeUmrk&usqp=CAU'),
          ),
        ),

    );
  }
}

