import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';
import 'home_page.dart';
import 'login.dart';

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final List titles = [
    "https://images.pexels.com/photos/4047000/pexels-photo-4047000.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://media.istockphoto.com/id/538167408/photo/vitamins-in-fruits-and-vegetables.jpg?b=1&s=612x612&w=0&k=20&c=v1IVYQOZ2Oec4ViSXemKYakrqchZeKMWgi4idn5tTEY=",
    "https://images.pexels.com/photos/3986972/pexels-photo-3986972.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
  final List subtitles = [
    "Medicines",
    "Multivitamins",
    "Masks/Sanitizer",
  ];
  final List image = [
    Home(),
    Home(),
    Home(),
  ];

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
                SizedBox(width: 70.00),
                Text("Pharma@Home App", style: TextStyle(color: Colors.white)),
                SizedBox(width: 30.00),
                Icon(Icons.shopping_cart),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Row(children: [
              TextButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PharmaApp();
                    }),
                  );
                  print("hello");
                },
              ),
              Text("Hello",
                  style:
                      TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: 500,
                    height: 350,
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
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: GridView.builder(
                                padding: EdgeInsets.all(5),
                                itemCount: 3,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(children: [
                                    Expanded(
                                        child: TextButton(
                                            child: Image(
                                                image:
                                                    NetworkImage(titles[index]),
                                                width: 250,
                                                height: 200,
                                                fit: BoxFit.cover),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        image[index]),
                                              );
                                            })),

                                    // SizedBox(height: 10),

                                    Text(
                                      subtitles[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ]);
                                }))))),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'RETURN POLICY',
                            style: TextStyle(
                              color: Color(0xff8b4506),
                            ),
                          ),
                          content: Expanded(
                              child: Column(
                            children: [
                              Text(
                                  'You have to visit our pharmacy in person for returning items, if any.',
                                  style: TextStyle(
                                    color: Color(0xff8b4506),
                                  )),
                              TextButton(
                                child: Text("Close",
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Color(0xff8b4506),
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ))));
                },
                child: Text("Return Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      backgroundColor: Color(0xff8b4506),
                    ))),
            SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Contact us',
                            style: TextStyle(
                              color: Color(0xff8b4506),
                            ),
                          ),
                          content: Column(
                            children: [
                              Text(
                                  'It is still a demo app created under the guidance of COMIT, Canada team.',
                                  style: TextStyle(
                                    color: Color(0xff8b4506),
                                  )),
                              TextButton(
                                child: Text("Close",
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Color(0xff8b4506),
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )));
                },
                child: Text("Contact us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      backgroundColor: Color(0xff8b4506),
                    ))),
          ])),
    ]));
  }
}
