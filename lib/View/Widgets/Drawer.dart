import 'package:attendancesys/View/Edit_Profile.dart';
import 'package:attendancesys/View/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///////////////////////////
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
              // Perform action when the first list tile is tapped
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: ()async {

              final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

              sharedPreferences.remove('email');

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SplashScreen2()),

              );
              // Perform action when the second list tile is tapped
            },
          ),
        ],
      ),
    );
  }
}