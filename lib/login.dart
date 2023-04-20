import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'profile.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MApp());
}

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PharmaApp(),
    );
  }
}

class PharmaApp extends StatefulWidget {
  @override
  _PharmaAppState createState() => _PharmaAppState();
}

class _PharmaAppState extends State<PharmaApp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            title: Text("Welcome to Pharma@Home App",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xff8b4506),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
              child: Container(
                  width: 300,
                  height: 300,
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
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                              )),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 30),
                          TextButton(
                              onPressed: () async {
                                try {
                                  final UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                                  print(
                                      "User logged in: ${userCredential.user!.uid}");

                                  // Navigate to HomePage after successful login
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileApp()),
                                  );
                                } catch (e) {
                                  if (e is FirebaseAuthException) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');

                                      showDialog(
                                          context: context,
                                          builder: (context) => Container(
                                              height: 30.00,
                                              alignment: Alignment.center,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    'Login failed',
                                                    style: TextStyle(
                                                      color: Color(0xff8b4506),
                                                    ),
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      Text(
                                                          'No user found for that email',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8b4506),
                                                          )),
                                                      TextButton(
                                                        child: Text("Close",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff8b4506),
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ))));
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                      showDialog(
                                          context: context,
                                          builder: (context) => Container(
                                              height: 30.00,
                                              alignment: Alignment.center,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    'Login failed',
                                                    style: TextStyle(
                                                      color: Color(0xff8b4506),
                                                    ),
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      Text(
                                                          'Wrong password provided for the user',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8b4506),
                                                          )),
                                                      TextButton(
                                                        child: Text("Close",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff8b4506),
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ))));
                                    } else {
                                      print('Error: ${e.message}');
                                      showDialog(
                                          context: context,
                                          builder: (context) => Container(
                                              height: 30.00,
                                              alignment: Alignment.center,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    'Login failed',
                                                    style: TextStyle(
                                                      color: Color(0xff8b4506),
                                                    ),
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      Text(
                                                          'Error: ${e.message}',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8b4506),
                                                          )),
                                                      TextButton(
                                                        child: Text("Close",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff8b4506),
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ))));
                                    }
                                  } else {
                                    print('Error: $e');
                                    showDialog(
                                        context: context,
                                        builder: (context) => Container(
                                            height: 30.00,
                                            alignment: Alignment.center,
                                            child: AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text(
                                                  'Login failed',
                                                  style: TextStyle(
                                                    color: Color(0xff8b4506),
                                                  ),
                                                ),
                                                content: Column(
                                                  children: [
                                                    Text('Error: $e',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8b4506),
                                                        )),
                                                    TextButton(
                                                      child: Text("Close",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8b4506),
                                                          )),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ))));
                                  }
                                }
                                ;
                              },
                              child: Text("Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Color(0xff8b4506),
                                    fontSize: 24.0,
                                  ))),
                          Text("Not an existing customer?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return SignUpApp();
                                  }),
                                );
                              },
                              child: Text("Click here for Sign Up",
                                  style: TextStyle(
                                    color: Color(0xff8b4506),
                                    fontSize: 12.0,
                                  ))),
                        ],
                      ),
                    ),
                  ))))
    ]));
  }
}
