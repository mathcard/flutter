import 'package:flutter/material.dart';
import 'package:meetup01/pages/home_page.dart';
import 'package:meetup01/pages/perfil.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    routes: {'/perfil': (context) => perfilPage()},
  )
);

// fluro - bibliotece sobre rotas
//https://github.com/joaohhenriq/flutter-sliver-effect