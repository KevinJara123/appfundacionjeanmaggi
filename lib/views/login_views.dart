import 'package:flutter/material.dart';
import 'package:appfundacionjeanmaggi/screen/main_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Image.network(
            'https://scontent.fncj2-1.fna.fbcdn.net/v/t1.6435-9/105935692_3601123769904384_448219930109794819_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=J9q4vj9l8NoAX-ofy7N&_nc_ht=scontent.fncj2-1.fna&oh=00_AfAyNGLDTqJHOnaoZLdU13iRKGkWLIo6dZU8iLbonUsrmg&oe=65E4B2B4', // Reemplaza con la URL real de la imagen
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 280,
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Inicia sesión',  // Texto agregado
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildCustomTextField(Icons.email, 'Enter your email',
                          TextInputType.emailAddress),
                      const SizedBox(height: 10),
                      _buildCustomTextField(Icons.lock, 'Enter your password',
                          TextInputType.visiblePassword,
                          obscureText: true),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF181717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          minimumSize: const Size(200, 50),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'o inicia sesión con',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildSocialButton(Icons.android, 'Google'),
                        const SizedBox(height: 10),
                        _buildSocialButton(Icons.apple, 'Apple'),
                        const SizedBox(height: 10),
                        _buildSocialButton(Icons.facebook, 'Facebook'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextField(
      IconData prefixIcon, String placeholder, TextInputType inputType,
      {bool obscureText = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextField(
        obscureText: obscureText,
        keyboardType: inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            color: const Color(0xFF323250),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF323250),
          ),
        ),
        style: TextStyle(
          color: const Color(0xFF323250),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String text) {
    return ElevatedButton(
      onPressed: () {
        // Maneja la acción del botón social
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF181717),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(200, 40),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
