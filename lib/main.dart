import 'package:flutter/material.dart';
import 'package:appfundacionjeanmaggi/views/login_views.dart'; // Importa tu vista de inicio de sesión


void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const LoginView(), // Cambiado para mostrar la vista de inicio de sesión
    );
  }
}