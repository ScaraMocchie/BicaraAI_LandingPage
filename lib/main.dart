import 'package:flutter/material.dart';
import 'package:flutter_application_1/slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/SubmitPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPage = 0;
  var _controller = new PageController();
  List<Widget> _pages = [
    SliderPage(
        "Welcome to Bicara AI",
        "Bicara AI is a mobile app to help people prepare their English Proficiency Test by providing an IELTS Speaking Mock Test / Simulation with lengthy feedback in the area of grammar, fluency and others",
        "images/undraw_educator_re_ju47.svg"),
    SliderPage(
        "Get Personal IELTS Speaking Coach",
        "With Bicara AI you can get 24/7 Personal IELTS Speaking Coach in your fingertips",
        "images/personal_coach.svg"),
    SliderPage(
        "Boost Your Confidence",
        "Bicara AI can boost your confidence affordably",
        "images/confidence.svg")
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Container(
            margin: EdgeInsets.only(left: 15
            ),
            child: Image.asset(
              "images/logo.png",
              height: 35,
            )),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return _pages[index];
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.5)),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){return SubmitPage();}));
                },
                child: Container(
                  child: Text("JOIN US", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),),
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
              SizedBox(height: 70,)
            ],
          )
        ],
      ),
    );
  }
}
