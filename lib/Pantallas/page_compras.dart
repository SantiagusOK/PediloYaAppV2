import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_adios.dart';
import 'package:pedilo_ya/Pantallas/page_carrito.dart';
import 'package:pedilo_ya/Pantallas/page_comprobante.dart';
import 'package:pedilo_ya/Pantallas/page_fav.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
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
        backgroundColor: Color.fromARGB(255, 224, 224, 224),
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
                                      comprobante: user.comprasUsuario[index1],
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                child: Text('No tienes compras realizadas'),
              ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 50),
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
                        child: Image.asset(
                          datos.usuario().fotoPerfil,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          datos.usuario().nombreCompleto,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text('@${datos.usuario().nombreDeUsuario}',
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaginaCarrito(),
                      ));
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.favorite_outline_rounded),
                    SizedBox(width: 10),
                    Text('Favorito')
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaginaFavorito()));
                },
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaginaAdios()));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
