import 'package:flutter/material.dart';

import 'package:pedilo_ya/Pantallas/page_comprobante.dart';

import 'package:pedilo_ya/Pantallas/widgets/drawer.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/usuario.dart';
import 'package:provider/provider.dart';

class PaginaCompras extends StatelessWidget {
  const PaginaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(builder: (context, datos, child) {
      Usuario user = datos.usuario();
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 224, 224, 224),
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text(
              'Mis Compras',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: user.comprasUsuario.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  itemCount: user.comprasUsuario.length,
                  itemBuilder: (BuildContext context, int index1) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(143, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(200),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaComprobante(
                                        comprobante:
                                            user.comprasUsuario[index1],
                                        lugar: 'misCompras',
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height:
                                user.comprasUsuario[index1].misCompras.length *
                                    120.0,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(10),
                              itemCount:
                                  user.comprasUsuario[index1].misCompras.length,
                              itemBuilder: (BuildContext context, int index2) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          user.comprasUsuario[index1]
                                              .misCompras[index2].imagen,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        user.comprasUsuario[index1]
                                            .misCompras[index2].nombre,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Colors.transparent,
                  ),
                )
              : const Center(
                  child: Text(
                    'No has realizado ninguna compra',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ),
          drawer: DrawerApp(user: user, lugar: 3));
    });
  }
}
