import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_final.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/usuario.dart';
import 'package:provider/provider.dart';

class PaginaResultado extends StatefulWidget {
  const PaginaResultado({super.key});

  @override
  State<PaginaResultado> createState() => _PaginaResultadoState();
}

class _PaginaResultadoState extends State<PaginaResultado> {
  void mostrarCartelDecision() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'Seguro que quieres cancelar el pedido',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        actions: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaginaMenu())),
                  child: const Text(
                    'Si',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        Comprobante comprobante = Comprobante(
            nombre: datos.usuario().nombreCompleto,
            direccion: datos.usuario().direccion,
            tipoDePago: 'efectivo',
            misCompras: List.from(datos.usuario().listaCarrito));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Column(
              children: [
                //---------------------------------- LISTA DE LAS COMIDAS PEDIDAS
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: datos.listaCarrito().length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///////////////////////////////////////////////////// IMAGEN DE LA COMIDA
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              comprobante.misCompras[index].imagen,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          ///////////////////////////////////////////////////// NOMBRE DE LA COMIDA
                          SizedBox(
                            width: 120,
                            child: Text(
                              comprobante.misCompras[index].nombre,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17),
                            ),
                          ),
                          ///////////////////////////////////////////////////// CANTIDAD DE LA COMIDA
                          Text('x${comprobante.misCompras[index].cantidad}',
                              style: const TextStyle(fontSize: 17)),
                          ///////////////////////////////////////////////////// PRECIO DE LA COMIDA
                          Text('\$${comprobante.misCompras[index].precio}',
                              style: const TextStyle(fontSize: 17)),
                        ],
                      );
                    },
                  ),
                ),
                ///////////////////////////////////////////////////// CUADRO DE DATOS
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 250,
                  width: double.infinity,
                  color: Colors.red,
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          ///////////////////////////////////////////////////// NOMBRE
                          children: [
                            const SizedBox(
                                width: 130,
                                child: Text(
                                  'Nombre:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(comprobante.nombre,
                                    style: const TextStyle(
                                        fontSize: 18,
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
                                width: 130,
                                child: Text(
                                  'Direccion:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(comprobante.direccion,
                                    style: const TextStyle(
                                        fontSize: 18,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(comprobante.tipoDePago,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //--------------------------------------BARRA DE ABAJO
          bottomNavigationBar: Container(
            color: Colors.red,
            height: 90,
            child: Row(
              children: [
                //----------------------------------------------TEXT TOTAL DE LA COMIDA
                SizedBox(
                  width: 155,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('TOTAL:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900)),
                      //----------------------------------------------TOTAL DE LA COMIDA
                      Text('\$${datos.resultadoCarrito()}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                ),
                //----------------------------------------------BOTON DE CANCELAR
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      mostrarCartelDecision();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text('Cancelar'),
                      ],
                    ),
                  ),
                ),
                //----------------------------------------------BOTON DE PEDILO
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 60, 145, 64),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      datos.guardarComprobante(comprobante);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaginaFinal(),
                          ));
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Text('PEDILO'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        height: 160,
                        width: 160,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://totalnewsagency.com/wp-content/uploads/2023/11/MASSA-DRO-1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            'TITO CALDERON',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('@titocalderon230',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.home_outlined),
                      SizedBox(width: 10),
                      Text('Menu')
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaginaMenu()));
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10),
                      Text('Carrito')
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.favorite_outline_rounded),
                      SizedBox(width: 10),
                      Text('Favorito')
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.shopping_basket_outlined),
                      SizedBox(width: 10),
                      Text('Mis Compras')
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 10),
                      Text('Salir')
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
