import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Petakrb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];

    marker = [
      Marker(
        point: LatLng(-1.134579, 116.856312),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (context) {
                return AlertDialog(
                  title: Text("Gedung Informasi"),
                  content: Text("Ini Lokasi Gedung Informasi."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Menutup AlertDialog
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
            color: Colors.green,
            size: 30,
          ),
        ),
      ),
      Marker(
        point: LatLng(-1.133208, 116.855357),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (context) {
                return AlertDialog(
                  title: Text("Ruang Terbuka"),
                  content: Text("Ini Lokasi Ruang Terbuka."),
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
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
      Marker(
        point: LatLng(-1.133351, 116.855751),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (context) {
                return AlertDialog(
                  title: Text("Lamin"),
                  content: Text("Ini Lokasi Lamin."),
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
            color: Colors.yellow,
            size: 30,
          ),
        ),
      ),
      Marker(
        point: LatLng(-1.134190, 116.855873),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: ctx,
              builder: (context) {
                return AlertDialog(
                  title: Text("Mushola"),
                  content: Text("Ini Lokasi Mushola."),
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
            color: Colors.orange,
            size: 30,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Center(
          child: Container(
              child: Column(children: [
        Flexible(
            child: FlutterMap(
          options: MapOptions(center: LatLng(-1.13392, 116.85521), zoom: 18),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: marker,
            ),
          ],
        ))
      ]))),
    );
  }
}
