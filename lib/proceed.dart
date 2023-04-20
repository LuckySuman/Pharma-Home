import 'package:flutter/material.dart';
import 'home_page.dart';
import 'credit.dart';

void main() {
  runApp(ProceedApp());
}

class ProceedApp extends StatefulWidget {
  @override
  State<ProceedApp> createState() => _ProceedAppState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _ProceedAppState extends State<ProceedApp> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();

    super.dispose();
  }

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
                  "Enter Delivery Address Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8b4506),
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Province/Territory',
                  ),
                ),
                SizedBox(height: 5.00),
                TextField(
                  controller: myController6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Postal Code',
                  ),
                ),
                SizedBox(height: 5.00),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Column(
                          children: [
                            Text("Your Delivery Address Detail is:"),
                            SizedBox(height: 3.0),
                            Text("Full Name :" + myController1.text),
                            SizedBox(height: 3.0),
                            Text("Phone Number :" + myController2.text),
                            SizedBox(height: 3.0),
                            Text("Address :" + myController3.text),
                            SizedBox(height: 3.0),
                            Text("City :" + myController4.text),
                            SizedBox(height: 3.0),
                            Text("Province/Territory :" + myController5.text),
                            SizedBox(height: 3.0),
                            Text("PostalCode :" + myController6.text),
                            SizedBox(height: 3.0),
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
                        ));
                      },
                    );
                  },
                  child: Text(
                    "Save Details",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Color(0xff8b4506),
                    ),
                  ),
                ),
                SizedBox(height: 5.00),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CreditApp();
                      }),
                    );
                    print("hello");
                  },
                  child: Text(
                    "Next",
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
