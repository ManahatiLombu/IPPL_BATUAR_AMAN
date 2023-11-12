import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Petakrb extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder<QuerySnapshot>(
            future: _firestore.collection('location').get(),
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
                var markerColor = data['color'] as String; 

                Color color;

                if (markerColor == 'orange') {
                  color = Colors.orange;
                } else if (markerColor == 'green') {
                  color = Colors.green;
                } else if (markerColor == 'blue') {
                  color = Colors.blue;
                } else if (markerColor == 'yellow') {
                  color = Colors.yellow;
                } else {
                  color = Colors.red; 
                }

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
                      color: color, // Menggunakan warna yang telah ditentukan
                      size: 30,
                    ),
                  ),
                );
              }).toList();

              return Column(
                children: [
                  Flexible(
                    child: FlutterMap(
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
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
