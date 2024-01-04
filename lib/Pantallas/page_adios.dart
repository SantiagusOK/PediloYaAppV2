import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_inicio.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaAdios extends StatefulWidget {
  const PaginaAdios({super.key});

  @override
  State<PaginaAdios> createState() => _PaginaAdiosState();
}

class _PaginaAdiosState extends State<PaginaAdios> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PaginaInicio()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 61, 60, 60),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  datos.usuario().fotoPerfil,
                  height: 150,
                ),
                const SizedBox(height: 10),
                Text(
                  datos.usuario().nombreCompleto,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Cerrando Sesion',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
