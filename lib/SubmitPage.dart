import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/thankyou.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitPage extends StatelessWidget {
  SubmitPage({super.key});

  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff0fd3d5),
            Color(0xff20bcda),
            Color(0xff32a6df),
            Color(0xff4292e3),
            Color(0xff527ee7),
          ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Let's\nJoin Us!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/joinus.svg",
                      width: 220,
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Email*",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    TextFormField(
                      controller: firstnameController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "First Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    TextFormField(
                      controller: lastnameController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Last Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(
                        height: 50,
                      ),
                    ElevatedButton(
                      style: ButtonStyle(padding:MaterialStatePropertyAll(EdgeInsets.all(0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),)),
                      onPressed: () {
                        Navigator.pushReplacement((context), MaterialPageRoute(builder: (context){return ThankYou();}));
                        CollectionReference colRef =
                            FirebaseFirestore.instance.collection("client");
                        colRef.add({
                          'email': emailController.text,
                          'firstname': firstnameController.text,
                          'lastname': lastnameController.text,
                        });

                      },
                      child: Container(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      height: 60,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(colors: [
                          Color(0xff20bcda),
                          Color(0xff32a6df),
                          Color(0xff4292e3),
                          Color(0xff527ee7)
                        ]),
                      ),
                    ),
                    ),
                    
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
