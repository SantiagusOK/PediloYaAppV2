import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_adios.dart';
import 'package:pedilo_ya/Pantallas/page_carrito.dart';
import 'package:pedilo_ya/Pantallas/page_compras.dart';
import 'package:pedilo_ya/Pantallas/page_fav.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class DrawerApp extends StatelessWidget {
  Usuario user;
  int lugar;
  // 0 menu
  // 1 carrito
  // 2 fav
  // 3 misCompras
  DrawerApp({super.key, required this.user, required this.lugar});

  @override
  Widget build(BuildContext context) {
    bool cambiarPagina(int p) {
      if (p == lugar) {
        return false;
      } else {
        return true;
      }
    }

    return Drawer(
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
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(user.fotoPerfil, fit: BoxFit.cover),
                  ),
                ),
                Column(
                  children: [
                    Text(user.nombreCompleto,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('@${user.nombreDeUsuario}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          // MENU
          ListTile(
            title: const Row(children: [
              Icon(Icons.home_outlined),
              SizedBox(width: 10),
              Text('Menu')
            ]),
            onTap: () {
              if (cambiarPagina(0)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaginaMenu()));
              }
            },
          ),
          // CARRITO
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.shopping_cart_outlined),
                SizedBox(width: 10),
                Text('Carrito')
              ],
            ),
            onTap: () {
              if (cambiarPagina(1)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaginaCarrito(),
                    ));
              }
            },
          ),
          // FAVORITO
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.favorite_outline_rounded),
                SizedBox(width: 10),
                Text('Favorito')
              ],
            ),
            onTap: () {
              if (cambiarPagina(2)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaginaFavorito(),
                    ));
              }
            },
          ),
          // MIS COMPRAS
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.shopping_basket_outlined),
                SizedBox(width: 10),
                Text('Mis Compras')
              ],
            ),
            onTap: () {
              if (cambiarPagina(3)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaginaCompras(),
                    ));
              }
            },
          ),
          // SALIR
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
                    builder: (context) => const PaginaAdios(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
