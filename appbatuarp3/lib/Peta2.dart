import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; 


class KrbRuangTerbuka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      markers: [ 
                        Marker(
                        point: LatLng(-1.133208, 116.855357),
                        builder: (ctx) => Icon(Icons.pin_drop, color: Colors.blue),
                      ),
                      ]
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
