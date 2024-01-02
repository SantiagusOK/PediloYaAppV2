import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_comprobante.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaFinal extends StatefulWidget {
  const PaginaFinal({super.key});

  @override
  State<PaginaFinal> createState() => _PaginaFinalState();
}

class _PaginaFinalState extends State<PaginaFinal> {
  @override
  void initState() {
    Datos datos = Provider.of<Datos>(context, listen: false);
    //datos.borrarCarrito();
    //print(datos.usuario().comprasUsuario[0].misCompras[0].nombre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 153, 69),
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
