import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'KRB.dart';
import 'Peta.dart';
import 'SecondPG.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDMwWUpBoPq-RWOOdPgVNavX7y-jEznyOo",
      authDomain: "batuar-a7ee4.firebaseapp.com",
      projectId: "batuar-a7ee4",
      storageBucket: "batuar-a7ee4.appspot.com",
      messagingSenderId: "983108320310",
      appId: "1:983108320310:android:64e9c4ca4da67221c5ac97",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balikpapan Tourism AR',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/KebunRayaDescription': (context) => KebunRayaDescription(),
        '/PetaKRB': (context) => Petakrb(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  bool isButtonEnabled = false;

@override
void initState() {
  super.initState();
  _usernameController.addListener(_checkIfButtonShouldBeEnabled);
}

void _checkIfButtonShouldBeEnabled() {
  setState(() {
    isButtonEnabled = _usernameController.text.isNotEmpty;
  });
}


  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.forest_rounded,
                  size: 75,
                ),
                SizedBox(height: 65.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'Sniglet',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Balikpapan Tourism AR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Sniglet',
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Masukkan Nama Anda',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(height: 50.0),
                
                ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () async {
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('User');
                          String username = _usernameController.text;
                          QuerySnapshot existingUser =
                              await users.where('nama', isEqualTo: username).get();
                          if (existingUser.docs.isNotEmpty) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            users.add({'nama': username});
                            Navigator.of(context).pushReplacementNamed('/home');
                          }
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 182, 153, 125)),
                    elevation: MaterialStateProperty.all<double>(6),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sniglet',
                      ),
                    ),
                  ),
                  child: Text('Masuk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SecondPage(),
    ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green[200],
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Container(
                        color: Color.fromRGBO(157, 181, 142, 1.0),
                        height: 65,
                        child: Center(
                          child: Image.asset(
                            'assets/tempat_wisata.png',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Container(
                        color: Color.fromRGBO(144, 175, 129, 1.0),
                        height: 65,
                        child: Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            child: Image.asset(
                              'assets/pencarian.png',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Container(
                        color: Color.fromRGBO(118, 149, 113, 1.0),
                        height: 65,
                        child: Center(
                          child: Container(
                            width: 75,
                            height: 75,
                            child: Image.asset(
                              'assets/kamera.png',
                              color: Colors.black,
                            ),
                          ), //
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Halaman tempat Wisata
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/hutan.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Container(
                  width: 334,
                  height: 215,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 70, 100, 70).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Kebun Raya Balikpapan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Jalan Soekarno Hatta Km. 15, Karang Joang,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Kec. Balikpapan Utara, Kota Balikpapan,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Kalimantan Timur 76127',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/KebunRayaDescription');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 157, 181, 139),
                              ),
                              child: Text('More'),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ini adalah Halaman 3'),
    );
  }
}
