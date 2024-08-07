import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text(
              'Welcome to Music App',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium, // Utilisez headlineMedium
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playlist');
              },
              child: Text(
                'Go to Playlist',
                style: TextStyle(
                    color: Colors.white), // Couleur du texte du bouton
              ),
            ),
          ],
        ),
      ),
    );
  }
}
