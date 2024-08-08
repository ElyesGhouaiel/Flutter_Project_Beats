import 'package:flutter/material.dart';

//Page faite par Elyes

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontFamily: 'FiraSans'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'assets/BeatsLogo.jpeg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Music App',
              style: TextStyle(
                fontFamily: 'FiraSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playlist');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF806491),
              ),
              child: Text(
                'Go to Playlist',
                style: TextStyle(
                  fontFamily: 'Numans',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ecole');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF806491),
              ),
              child: Text(
                'Chercher une école de musique',
                style: TextStyle(
                  fontFamily: 'Numans',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
