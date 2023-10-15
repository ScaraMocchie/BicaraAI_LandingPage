import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderPage(
                "Thank You!",
                "We will contact you for further information",
                "images/thankyou.svg"),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return MyApp();}));
                },
                child: Container(
                  child: Text("BACK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),),
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
                    ]
                  ),),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
