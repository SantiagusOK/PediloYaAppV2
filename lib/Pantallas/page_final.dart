import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_comprobante.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';

class PaginaFinal extends StatelessWidget {
  const PaginaFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 116, 61),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Su pedido fue tomado :)',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaginaMenu()));
              },
              child: const Text(
                'Volver',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaginaComprobante(),
                    ));
              },
              child: const Text(
                'Ver Comprobante',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
