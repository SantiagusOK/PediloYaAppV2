import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaCarrito extends StatefulWidget {
  const PaginaCarrito({super.key});

  @override
  State<PaginaCarrito> createState() => _PaginaCarritoState();
}

class _PaginaCarritoState extends State<PaginaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        return datos.listaCarrito().isNotEmpty
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red,
                ),
                body: Center(
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              datos.listaCarrito()[index].imagen,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              datos.listaCarrito()[index].nombre,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17),
                            ),
                          ),
                          Text('x${datos.listaCarrito()[index].cantidad}',
                              style: const TextStyle(fontSize: 17)),
                          Text('\$${datos.listaCarrito()[index].precio}',
                              style: const TextStyle(fontSize: 17)),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                datos.borrarComidaDelCarrito(index);
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
                    },
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
                        width: 195,
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
                      //----------------------------------------------BOTON DE AGREGAR
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
                                    builder: (context) => const PaginaMenu()));
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
                      //----------------------------------------------BOTON DE LISTO
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
                            //datos.mostrarListaCarrito();
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              Text('Listo'),
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
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red,
                ),
                body: const Center(
                  child: Text(
                    'Tu carrito está vacio',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(158, 0, 0, 0)),
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
