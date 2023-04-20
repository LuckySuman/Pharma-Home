import 'package:flutter/material.dart';

import 'profile.dart';

void main() {
  runApp(FinalApp());
}

class FinalApp extends StatelessWidget {
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
          title: Text("Pharma@Home App", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff8b4506),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 16,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
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
            child: Center(
              child: Column(children: [
                Text(
                  "Total Amount is \$27.50",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8b4506),
                  ),
                ),
                SizedBox(height: 20.00),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Container(
                            height: 30.00,
                            alignment: Alignment.center,
                            child: AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  'Payment status',
                                  style: TextStyle(
                                    color: Color(0xff8b4506),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Text(
                                        'Payment Successful! Your items will be shipped between 3-4 business days.',
                                        style: TextStyle(
                                          color: Color(0xff8b4506),
                                        )),
                                    TextButton(
                                      child: Text("Close",
                                          style: TextStyle(
                                            color: Color(0xff8b4506),
                                          )),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ))));
                  },
                  child: Text(
                    "Proceed to Payment",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Color(0xff8b4506),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ProfileApp();
                      }),
                    );
                    print("hello");
                  },
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Color(0xff8b4506),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        )),
      ),
    ]));
  }
}
