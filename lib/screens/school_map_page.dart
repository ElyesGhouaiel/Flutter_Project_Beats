import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:app_flutter_project_beats/screens/school_model.dart';

//Killian
class SchoolMapPage extends StatelessWidget {
  final School school;

  SchoolMapPage({required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(school.name),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(school.latitude, school.longitude),
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(school.latitude, school.longitude),
                builder: (ctx) => Container(
                  child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
