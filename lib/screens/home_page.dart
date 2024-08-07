import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontFamily: 'FiraSans'), // Appliquer Fira Sans pour le titre
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(200), // Définir le rayon des coins
              child: Image.asset(
                'assets/BeatsLogo.jpeg',
                height: 300,
                fit: BoxFit.cover, // Ajuste l'image dans le cadre avec le bord arrondi
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Music App',
              style: TextStyle(
                fontFamily: 'FiraSans', // Appliquer Fira Sans pour le texte
                fontSize: 24, // Taille de police
                fontWeight: FontWeight.bold, // Poids de police
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playlist');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF806491), // Couleur de fond du bouton
              ),
              child: Text(
                'Go to Playlist',
                style: TextStyle(
                  fontFamily: 'Numans', // Appliquer Numans pour le texte du bouton
                  color: Colors.white, // Couleur du texte du bouton
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
