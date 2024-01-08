import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/Pantallas/page_resultado.dart';
import 'package:pedilo_ya/Pantallas/page_tarjetas.dart';
import 'package:pedilo_ya/Pantallas/widgets/drawer.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/usuario.dart';
import 'package:provider/provider.dart';

class PaginaCarrito extends StatefulWidget {
  const PaginaCarrito({super.key});

  @override
  State<PaginaCarrito> createState() => _PaginaCarritoState();
}

class _PaginaCarritoState extends State<PaginaCarrito> {
  @override
  void initState() {
    Datos datos = Provider.of<Datos>(context, listen: false);
    if (datos.listaCarrito().length >= 2) {
      datos.combinarComida();
    }

    super.initState();
  }

  void mostrarCartelDecision() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(
          child: Text('Tipo de pago'),
        ),
        content: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(30, 0, 0, 0),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    minimumSize: const Size(double.infinity, 80),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaginaTarjetas()));
                  },
                  icon: const Icon(Icons.credit_card,
                      size: 50, color: Colors.black),
                  label: const Text(
                    'Transferencia',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  )),
              const SizedBox(height: 10),
              TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(30, 0, 0, 0),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    minimumSize: const Size(double.infinity, 80),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaginaResultado(
                                  tipoDePago: 'Efectivo',
                                )));
                  },
                  icon: const Icon(
                    Icons.attach_money_rounded,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Efectivo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  )),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
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
        Usuario user = datos.usuario();
        List<ComidaCarrito> listaCarrito = datos.listaCarrito();
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 224, 224, 224),
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Carrito',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
            ),
            body: listaCarrito.isNotEmpty
                ? Center(
                    child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: listaCarrito.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          ComidaCarrito comida = listaCarrito[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // FOTO DE LA COMIDA
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(comida.imagen,
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50)),

                              // NOMBRE DE LA COMIDA
                              SizedBox(
                                  width: 120,
                                  child: Text(comida.nombre,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 17))),

                              // CANTIDAD
                              Text('x${comida.cantidad}',
                                  style: const TextStyle(fontSize: 17)),

                              // PRECIO
                              Text('\$${comida.precio}',
                                  style: const TextStyle(fontSize: 17)),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    datos.borrarComidaDelCarrito(comida);
                                  });
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              )
                            ],
                          );
                        }))
                : const Center(
                    child: Text('Tu carrito esta vacio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey))),
            // BARRA DE ABAJO
            bottomNavigationBar: listaCarrito.isNotEmpty
                ? Container(
                    color: Colors.red,
                    height: 90,
                    // CONTENIDO
                    child: Row(
                      children: [
                        SizedBox(
                          width: 195,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // TEXTO TOTAL
                              const Text('TOTAL:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900)),
                              // PRECIO TOTAL
                              Text('\$${datos.resultadoCarrito()}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25)),
                            ],
                          ),
                        ),
                        // BOTON DE AGREGAR
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaginaMenu()));
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('Agregar'),
                              ],
                            ),
                          ),
                        ),
                        // BOTON DE LISTO
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
                              //datos.mostrarListaCarrito();
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.check), Text('Listo')]),
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
            drawer: DrawerApp(user: user, lugar: 1));
      },
    );
  }
}
