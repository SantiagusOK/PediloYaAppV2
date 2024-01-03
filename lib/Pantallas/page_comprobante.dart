import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_adios.dart';
import 'package:pedilo_ya/Pantallas/page_compras.dart';
import 'package:pedilo_ya/Pantallas/page_final.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaComprobante extends StatelessWidget {
  const PaginaComprobante(
      {super.key, required this.comprobante, required this.lugar});
  final Comprobante comprobante;
  final String lugar;

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(builder: (context, datos, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => lugar == 'misCompras'
                            ? const PaginaCompras()
                            : const PaginaFinal()));
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            width: 370,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ////////////////////// TITULO
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/mini_logo.png',
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'COMPROBANTE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ////////////////////// CUADRADO DE LA LISTA DE COMIDA
                Container(
                  padding: EdgeInsets.all(10),
                  width: 340,
                  height: 330,
                  color: Colors.white,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: comprobante.misCompras.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 120,
                                child: Text(
                                  comprobante.misCompras[index].nombre,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            SizedBox(
                              child: Text(
                                  'x${comprobante.misCompras[index].cantidad}'),
                            ),
                            Text('\$${comprobante.misCompras[index].precio}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ////////////////////// CUADRADO DE LOS DATOS
                Container(
                  width: 340,
                  height: 160,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        ///////////////////////////////////////////////////// NOMBRE
                        children: [
                          const SizedBox(
                              width: 130,
                              child: Text(
                                'TOTAL:',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text('\$${comprobante.precioTotal}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        ///////////////////////////////////////////////////// NOMBRE
                        children: [
                          const SizedBox(
                              width: 130,
                              child: Text(
                                'Nombre:',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(comprobante.nombre,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ///////////////////////////////////////////////////// DIRECCION
                      Row(
                        children: [
                          const SizedBox(
                              width: 120,
                              child: Text(
                                'Direccion:',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(comprobante.direccion,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ///////////////////////////////////////////////////// TIPO DE PAGO
                      Row(
                        children: [
                          const SizedBox(
                              width: 130,
                              child: Text(
                                'Tipo de pago:',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(comprobante.tipoDePago,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
