import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/playlist_page.dart';
import 'screens/song_detail_page.dart';
import 'screens/ecole_page.dart'; // Importez le nouvel écran

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF2F70AF),
        secondaryHeaderColor: Color(0xFFB9848C),
        scaffoldBackgroundColor: Color(0xFF2F70AF),
        appBarTheme: AppBarTheme(
          color: Color(0xFFB9848C),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Colors.white, fontSize: 20),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.grey),
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF2F70AF),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF2F70AF),
          onPrimary: Colors.white,
          secondary: Color(0xFFB9848C),
          onSecondary: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Color(0xFF2F70AF),
          onSurface: Colors.white,
          error: Colors.red,
          onError: Colors.white,
        ),
      ),
      home: HomePage(),
      routes: {
        '/playlist': (context) => PlaylistPage(),
        '/songDetail': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return SongDetailPage(
            title: args['title']!,
            artist: args['artist']!,
            image: args['image']!,
            audioUrl: args['audioUrl']!, // Passez l'URL de l'audio
          );
        },
        '/ecole': (context) => EcolePage(),
      },
    );
  }
}
