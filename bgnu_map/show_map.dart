import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map - BGNU")),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(31.4501, 73.7065), // Approx. location of Daanish School Nankana
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.address_bgnu',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(31.4501, 73.7065),
                width: 60,
                height: 60,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
