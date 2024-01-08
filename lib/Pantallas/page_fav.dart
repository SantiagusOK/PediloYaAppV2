import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/widgets/botones_comida.dart';
import 'package:pedilo_ya/Pantallas/widgets/drawer.dart';
import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/usuario.dart';
import 'package:provider/provider.dart';

class PaginaFavorito extends StatefulWidget {
  const PaginaFavorito({super.key});

  @override
  State<PaginaFavorito> createState() => _PaginaFavoritoState();
}

class _PaginaFavoritoState extends State<PaginaFavorito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        Usuario users = datos.usuario();
        List<Comida> listComidaFavorito = datos.usuario().comidaFavorito;
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 224, 224, 224),
            appBar: AppBar(
                backgroundColor: Colors.red,
                title: Image.asset('lib/images/mini_logo.png', height: 20),
                centerTitle: true),
            body: listComidaFavorito.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.transparent),
                    padding: const EdgeInsets.all(20),
                    itemCount: datos.usuario().comidaFavorito.length,
                    itemBuilder: (BuildContext context, int index) {
                      Comida comida = datos.usuario().comidaFavorito[index];
                      return BotonesComida(comida: comida);
                    },
                  )
                : const Center(
                    child: Text('No tienes comidas favoritas guardadas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey))),
            drawer: DrawerApp(user: users, lugar: 2));
      },
    );
  }
}
