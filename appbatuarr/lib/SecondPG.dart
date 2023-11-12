import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'Tempat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            'assets/KRB.jpg',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KrbGedungInformasi()),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KrbRuangTerbuka()),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KrbLamin()),
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    backgroundColor: Color.fromARGB(255, 212, 212, 212),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child:
                      Image.asset('assets/lokasi.png', width: 34, height: 34),
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String selectedLocationType = '';

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
        .where((item) =>
            item.toLowerCase().replaceAll(' ', '').contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            selectedLocationType = 'krb${suggestions[index].toLowerCase().replaceAll(' ', '')}';
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (selectedLocationType.isEmpty) {
      return Center(
        child: Text('Lokasi Tidak Ada'),
      );
    }

    return FutureBuilder<QuerySnapshot>(
      future: _firestore
          .collection('location')
          .where('type', isEqualTo: selectedLocationType)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('Tidak ada data');
        }

        var markers = snapshot.data!.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          var latitude = data['latitude'] as double;
          var longitude = data['longitude'] as double;
          var markerName = data['name'] as String;
          var locationType = data['type'] as String;
          var markerColor = getMarkerColor(locationType);

          return Marker(
            point: LatLng(latitude, longitude),
            builder: (ctx) => GestureDetector(
              onTap: () {
                showDialog(
                  context: ctx,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(markerName),
                      content: Text("Ini Lokasi $markerName."),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tutup"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: markerColor,
                size: 30,
              ),
            ),
          );
        }).toList();

        return FlutterMap(
          options: MapOptions(center: LatLng(-1.13392, 116.85521), zoom: 18),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: markers,
            ),
          ],
        );
      },
    );
  }

  Color getMarkerColor(String locationType) {
    if (locationType == 'krbgedunginformasi') {
      return Colors.green;
    } else if (locationType == 'krbruangterbuka') {
      return Colors.blue;
    } else if (locationType == 'krblamin') {
      return Colors.orange;
    } else if (locationType == 'krbmushola') {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
