import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'Peta1.dart';
import 'Peta2.dart';
import 'Peta3.dart';

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
    final Map<String, Color> placeColorMap = {
      'Gedung Informasi': Colors.green,
      'Ruang Terbuka': Colors.blue,
      'Lamin': Colors.yellow,
      'Mushola': Colors.orange,
    };

    final List<Marker> markers = myList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .map((place) {
      final Color markerColor = placeColorMap[place] ?? Colors.red;
      final LatLng placeCoordinates = getCoordinatesForPlace(place);
      return Marker(
        width: 30.0,
        height: 30.0,
        point: placeCoordinates,
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(place),
                  content: Text('Ini lokasi $place'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
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
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }

  LatLng getCoordinatesForPlace(String place) {
    final Map<String, LatLng> placeCoordinates = {
      'Gedung Informasi': LatLng(-1.134579, 116.856312),
      'Ruang Terbuka': LatLng(-1.133208, 116.855357),
      'Lamin': LatLng(-1.133351, 116.855751),
      'Mushola': LatLng(-1.134190, 116.855873),
    };

    return placeCoordinates[place] ?? LatLng(0.0, 0.0);
  }
}
