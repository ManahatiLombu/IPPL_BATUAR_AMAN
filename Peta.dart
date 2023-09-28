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
            builder: (ctx) => Icon(Icons.pin_drop, color: Colors.green),
            ),
      Marker(
            point: LatLng(-1.133208, 116.855357),
            builder: (ctx) => Icon(Icons.pin_drop, color: Colors.blue),
            ),
      Marker(
            point: LatLng(-1.133351, 116.855751),
            builder: (ctx) => Icon(Icons.pin_drop, color: Colors.orange),
            ),
       Marker(
            point: LatLng(-1.134190, 116.855873),
            builder: (ctx) => Icon(Icons.pin_drop, color: Colors.yellow),
            ),
      
    ];

    return Scaffold(
      body: Center(
        child: Container(
          child : Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: 
                  MapOptions(center: LatLng(-1.13392, 116.85521), zoom:18),
                  layers: [TileLayerOptions(
                    urlTemplate: 
                       "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      markers: marker,
                    ),
                  ],
                )
              )
            ]
          )
        )
      ),
    );
  }
}
