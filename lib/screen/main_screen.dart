// Importa el paquete de Flutter para widgets de interfaz de usuario
import 'package:flutter/material.dart';
// Importa el widget HomeViews desde el archivo home.dart
import 'package:appfundacionjeanmaggi/views/home_views.dart';
// Importa el widget Hoyviews desde el archivo hoy_views.dart
import 'package:appfundacionjeanmaggi/views/hoy_views.dart';

// Define un widget de tipo StatefulWidget llamado MainScreen
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  // Sobrescribe el método createState para devolver una instancia de _MainScreenState
  @override
  State<MainScreen> createState() => _MainScreenState();
}

// Define la clase de estado _MainScreenState que extiende State<MainScreen>
class _MainScreenState extends State<MainScreen> {
  // Variable para almacenar el índice de la página actual
  int currentPageIndex = 0;
  // Color blanco que se utilizará para los iconos
  final iconColor = Colors.white;

  // Sobrescribe el método build para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.white;
    // Utiliza el tema actual del contexto y aplica un tema específico
    return Theme(
      data: Theme.of(context),
      // Utiliza el widget Scaffold como estructura básica de la pantalla
      child: Scaffold(
        // Barra de navegación inferior personalizada
        bottomNavigationBar: NavigationBar(
          // Función que se llama cuando se selecciona una opción en la barra de navegación
          onDestinationSelected: (int index) {
            // Actualiza el índice de la página actual al índice seleccionado
            setState(() {
              currentPageIndex = index;
            });
          },
          // Color del indicador que resalta la opción seleccionada
          indicatorColor: const Color(0xFFFFFFFF),
          // Índice de la opción actualmente seleccionada
          selectedIndex: currentPageIndex,
          // Color de fondo de la barra de navegación
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          // Lista de destinos (opciones) en la barra de navegación
          destinations: const <Widget>[
            NavigationDestination(
              // Icono cuando está seleccionado
              selectedIcon: Icon(Icons.home),
              // Icono normal
              icon: Icon(Icons.home_outlined,color: iconColor),
              // Etiqueta de la opción
              label: 'Home',
            
              
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined, color: iconColor,),
              label: 'Hoy',
              
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.task),
              icon: Icon(Icons.task_outlined,color: iconColor),
              label: 'Tareas',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.workspace_premium_rounded),
              icon: Icon(Icons.workspace_premium_outlined,color: iconColor),
              label: 'Logros',
            ),
          ],
        ),
        // Cuerpo de la pantalla, construido por el método _buildBody()
        body: _buildBody(),
      ),
    );
  }

  // Método privado para construir el cuerpo de la pantalla según el índice actual
   Widget _buildBody() {
    // Utiliza una declaración switch para determinar qué vista mostrar según el índice
    switch (currentPageIndex) {
      // Si el índice es 0, devuelve la vista HomeViews
      case 0:
        return const HomeViews();
        
      // Si el índice es 1, devuelve la vista HoyView
      case 1:
        return const HoyView();
              
      // Si el índice no es 0 ni 1, devuelve un contenedor de tamaño cero (puedes cambiar esto según tus necesidades)
      default:
        return const SizedBox.shrink();
    }
   }
}