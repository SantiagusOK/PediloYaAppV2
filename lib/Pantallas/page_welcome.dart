import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaWelcome extends StatefulWidget {
  const PaginaWelcome({super.key});

  @override
  State<PaginaWelcome> createState() => _PaginaWelcomeState();
}

class _PaginaWelcomeState extends State<PaginaWelcome> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PaginaMenu()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(builder: (context, datos, child) {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                datos.usuario().nombreCompleto,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                'BIENVENIDO',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}
