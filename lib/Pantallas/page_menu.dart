import 'dart:convert';

import 'package:pedilo_ya/Pantallas/page_adios.dart';
import 'package:pedilo_ya/Pantallas/page_carrito.dart';
import 'package:pedilo_ya/Pantallas/page_comida_edit.dart';
import 'package:pedilo_ya/datos/menu.dart';
import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaMenu extends StatelessWidget {
  const PaginaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Menu menu = Menu();
    return Consumer<Datos>(
      builder: (context, datos, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Image.asset(
              'lib/images/mini_logo.png',
              height: 20,
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.all(20),
            itemCount: menu.listMenu.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: double.infinity,
                child: Container(
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(143, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  // ------------------------------------------------------------------BOTON
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaEdit(index: index)));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ------------------------------------------------------------------IMAGEN DE LA COMIDA
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              menu.listMenu[index].imagen,
                              fit: BoxFit.cover,
                              width: 400,
                              height: 250,
                            ),
                          ),
                          // ------------------------------------------------------------------NOMBRE DE LA COMIDA
                          Text(
                            menu.listMenu[index].nombre,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ------------------------------------------------------------------PRECIO DE LA COMIDA
                                Text(
                                  '\$${menu.listMenu[index].precio}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                // ------------------------------------------------------------------ICON DE FAVORITOS
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_rounded,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ), /**/
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 15),
                      /*Container(
                        height: 160,
                        width: 160,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.memory(
                            base64Decode(datos.usuario().fotoPerfil),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),*/
                      Column(
                        children: [
                          Text(
                            datos.usuario().nombreCompleto,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('@${datos.usuario().nombreDeUsuario}',
                              style: const TextStyle(color: Colors.white)),
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
                  onTap: () {},
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
      },
    );
  }
}
