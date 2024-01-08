import 'package:pedilo_ya/Pantallas/widgets/botones_comida.dart';
import 'package:pedilo_ya/Pantallas/widgets/drawer.dart';
import 'package:pedilo_ya/datos/menu.dart';
import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/usuario.dart';
import 'package:provider/provider.dart';

class PaginaMenu extends StatefulWidget {
  const PaginaMenu({super.key});

  @override
  State<PaginaMenu> createState() => _PaginaMenuState();
}

class _PaginaMenuState extends State<PaginaMenu> {
  @override
  void initState() {
    Datos datos = Provider.of<Datos>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        Menu menu = Menu();
        Usuario user = datos.usuario();
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 216, 216, 216),
            appBar: AppBar(
                backgroundColor: Colors.red,
                title: Image.asset('lib/images/mini_logo.png', height: 20),
                centerTitle: true),
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                itemCount: menu.listMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      // boton de la comida
                      BotonesComida(comida: menu.listMenu[index]),
                      const SizedBox(height: 30)
                    ],
                  );
                }),
            drawer: DrawerApp(user: user, lugar: 0));
      },
    );
  }
}
