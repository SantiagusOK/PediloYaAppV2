import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_login.dart';
import 'package:pedilo_ya/Pantallas/page_register.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'lib/images/fondo_inicio.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 88, 77),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(50),
                height: 370,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/mini_logo.png',
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '"Hay que proceder a pedirla"',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ////////////////////// BOTON INICIAR SESION
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(300, 80)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaginaLogin()));
                      },
                      child: const Text(
                        'Iniciar Sesion',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ////////////////////// BOTON REGISTRARSE
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(300, 80)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaginaRegister(imagen: '')));
                      },
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
