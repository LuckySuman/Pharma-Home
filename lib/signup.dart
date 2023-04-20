import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpApp(),
    );
  }
}

class SignUpApp extends StatefulWidget {
  @override
  _SignUpAppState createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
            title: Text("Welcome to Pharma@Home App",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xff8b4506),
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Row(children: [
              TextButton(
                child: Icon(Icons.arrow_back, color: Color(0xff8b4506)),
                //child: Text(
                //  "Home",
                // style: TextStyle(
                //   fontSize: 16,
                //  ),
                //  ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MApp();
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
                    width: 300,
                    height: 350,
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password should be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 32),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff8b4506)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Form is valid, register user
                                    _registerUser();
                                  }
                                },
                                /* showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            contentPadding: EdgeInsets.all(50),
                                            backgroundColor: Colors.white,
                                            title: Text(
                                              'Profile',
                                              style: TextStyle(
                                                color: Color(0xff8b4506),
                                              ),
                                            ),
                                            content: Column(
                                              children: [
                                                Text(
                                                    'You have successfully created your account.',
                                                    style: TextStyle(
                                                      color: Color(0xff8b4506),
                                                    )),
                                                TextButton(
                                                  child: Text("Close",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        backgroundColor:
                                                            Color(0xff8b4506),
                                                      )),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            ),
                                          ));
                                }
                              },*/
                                child: Text('Register',
                                    style: TextStyle(
                                        backgroundColor: Color(0xff8b4506))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))
          ]))
    ]));
  }

  Future<void> _registerUser() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print("User registered: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      print("Error registering user: ${e.code}");
    } catch (e) {
      print("Error registering user: $e");
    }
  }
}
