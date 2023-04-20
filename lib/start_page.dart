import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

void main() {
  runApp(StartPage());
}

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/3683041/pexels-photo-3683041.jpeg?auto=compress&cs=tinysrgb&w=600'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8b4506),
          title: Row(
            children: [
              Text("Pharma@Home App", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          SizedBox(height: 30.00),
          Center(
              child: Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.7),
                        spreadRadius: 2,
                        blurRadius: 16,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 16,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xff95775c),
                              width: 0.5,
                            ),
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Welcome to Pharma@Home App',
                                textAlign: TextAlign.center,
                                textStyle: const TextStyle(
                                  color: Color(0xff8b4506),
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 100,
                            pause: const Duration(milliseconds: 100),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ))))),
          TextButton(
            child: Text(
              "Get Started >>",
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                color: Colors.white,
                backgroundColor: Color(0xff8b4506),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MApp(),
                ),
              );
            },
          ),
          SizedBox(height: 100.00),
          Text(
            "Project made by: Lucky Suman",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Technologies used:",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "1.Firebase",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "2.Flutter",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "3.Dart",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      )
    ]));
  }
}
