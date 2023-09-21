import 'package:flutter/material.dart';
import 'Titik_AR.dart';
import 'KRB.dart';


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
      debugShowCheckedModeBanner : false,
      initialRoute: '/', 
      routes: {
        '/': (context) => MyHomePage(), 
        '/KebunRayaDescription': (context) => KebunRayaDescription(), 
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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
         backgroundColor: Colors.green[200],
          items: [
           BottomNavigationBarItem(
            icon: Image.asset('assets/tempat_wisata.png', width: 50, height: 50), 
            label: 'Halaman 1',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('assets/pencarian.png', width: 35, height: 35), 
            label: 'Halaman 2',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/kamera.png', width: 50, height: 50), 
            label: 'Halaman 3',
          ),
        ],
      ),
    );
  }
}

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
                    color: const Color.fromARGB(255, 70, 100, 70).withOpacity(0.8),
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
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
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
                          ),
                        ),
                      ), 

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton( 
                           onPressed: () {
                            Navigator.of(context).pushNamed('/KebunRayaDescription');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 157, 181, 139),
                            ),
                            child: Text('More'),
                          ),
                        )
                        ),
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






class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
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
          
                SizedBox(
                  height: 20.0,
                ),
            
              ],
            ),  
      );
  }
}




class CustomSearch extends SearchDelegate<String> {
  final List<String> myList = [
    'Information Center', 
    'Gazebo', 
    'Lamin', 
    'Taman Bermain'];

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
            query = results[index];
            showResults(context);
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
