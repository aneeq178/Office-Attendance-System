

import 'package:attendancesys/Model/Attendance_Data.dart';
import 'package:attendancesys/View/Dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';






class FireStore
{

  final auth= FirebaseAuth.instance;


  Future<bool> Auth({
    required String email,
    required String password,})
  async
  {
    try{
      final newUser=await auth.createUserWithEmailAndPassword(email: email, password: password);

      if(newUser!=null)
        {
         return true;
        }
      else{return false;}
    }
    catch(e)
    {
      print(e);
      return false;

    }



  }



  Future<bool> checkuser({ required String email,
    required String password,required BuildContext context})
  async
  {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );

      SnackBar snackBar = SnackBar(
        content: Text('Welcome back!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );



    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

         SnackBar snackBar = SnackBar(
          content: Text('User not found'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        SnackBar snackBar = SnackBar(
          content: Text('Wrong Password'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else{


      }
    }


    return false;

  }

  Future CreateUser({
    required String name,
    required String id,
    required String email,
    required String password,

  }) async {

    print('here');
    final docUser = FirebaseFirestore.instance.collection("user").doc(id);
    Userd user=Userd(name: name, id: id, email: email, password: password);
    await docUser.set(user.toJson());

    final SharedPreferences sharedpreferences= await SharedPreferences.getInstance();
    sharedpreferences.setString('id', id.toString());



    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('user').add(user.toJson());
      print('Data sent to Firebase successfully!');
    } catch (e) {
      print('Error sending data to Firebase: $e');
    }
  }
}