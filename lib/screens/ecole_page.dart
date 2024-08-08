import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_flutter_project_beats/screens/school_model.dart';
import 'package:app_flutter_project_beats/screens/school_map_page.dart';

//Killian

class EcolePage extends StatefulWidget {
  @override
  _EcolePageState createState() => _EcolePageState();
}

class _EcolePageState extends State<EcolePage> {
  late Future<List<School>> _futureSchools;

  @override
  void initState() {
    super.initState();
    _futureSchools = fetchSchools();
  }

  Future<List<School>> fetchSchools() async {
    final response = await http.get(Uri.parse(
        'https://data.opendatasoft.com/api/explore/v2.1/catalog/datasets/314549262_ecoles-de-musique-municipales-en-loire-atlantique@loireatlantique/records?limit=20'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((school) => School.fromJson(school)).toList();
    } else {
      throw Exception('Failed to load schools');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Écoles de Musique'),
      ),
      body: Center(
        child: FutureBuilder<List<School>>(
          future: _futureSchools,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("No data found");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final school = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SchoolMapPage(school: school),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blueGrey[800],
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              school.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              school.address,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            if (school.telephone != null) SizedBox(height: 5),
                            if (school.telephone != null)
                              Text(
                                'Téléphone: ${school.telephone}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            Text(
                              'Longitude: ${school.longitude}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Latitude: ${school.latitude}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
