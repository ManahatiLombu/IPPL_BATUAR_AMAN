import 'package:flutter/material.dart';
import 'KRB.dart';
import 'Peta.dart'; 
import 'Peta1.dart';
import 'Peta2.dart';
import 'Peta3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balikpapan Tourism',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/KebunRayaDescription': (context) => KebunRayaDescription(),
        '/PetaKRB': (context) => Petakrb(),
      },
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

//Halaman Pencarian
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pencarian Titik',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(162, 202, 152, 1),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/wisata.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 40.0,
                  child: InkWell(
                   onTap: () {   
                  Navigator.push( context, MaterialPageRoute(builder: (context) => KrbGedungInformasi()), 
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 275,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(161, 192, 120, 1),
                          width: 3.0,
                        ),
                        color: Color.fromRGBO(200, 236, 153, 1),
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
                      child: Center(
                        child: Text(
                          'Gedung Informasi',
                          style: TextStyle(
                            color: Color.fromRGBO(106, 134, 106, 1),
                            fontSize: 18,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Positioned(
                top: 150.0,
                child: InkWell(
                   onTap: () {   
                  Navigator.push( context, MaterialPageRoute(builder: (context) => KrbRuangTerbuka()), 
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 275,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(161, 192, 120, 1),
                          width: 3.0,
                        ),
                        color: Color.fromRGBO(200, 236, 153, 1),
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
                      child: Center(
                        child: Text(
                          'Ruang Terbuka',
                          style: TextStyle(
                            color: Color.fromRGBO(106, 134, 106, 1),
                            fontSize: 18,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Positioned(
                top: 260.0,
                child: InkWell(
                   onTap: () {   
                  Navigator.push( context, MaterialPageRoute(builder: (context) => KrbLamin()), 
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 275,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(161, 192, 120, 1),
                          width: 3.0,
                        ),
                        color: Color.fromRGBO(200, 236, 153, 1),
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
                      child: Center(
                        child: Text(
                          'Lamin',
                          style: TextStyle(
                            color: Color.fromRGBO(106, 134, 106, 1),
                            fontSize: 18,
                            fontFamily: 'Sniglet',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Positioned(
                bottom: 80.0,
                right: 20.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/PetaKRB');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20), 
                    backgroundColor: Color.fromARGB(255, 212, 212, 212), 
                    textStyle: TextStyle(fontSize: 18), 
                  ),
                  child: Image.asset('assets/lokasi.png',
                      width: 34,
                      height:
                          34),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  final List<String> myList = [
    'Gedung Informasi',
    'Ruang Terbuka',
    'Lamin',
    'Mushola'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = myList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   final List<String> results = myList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            // Tambahkan logika untuk membuka peta saat item ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Petakrb(), // Gantilah dengan nama halaman peta Anda
              ),
            );
          },
        );
      },
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
