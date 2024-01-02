import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_register.dart';
import 'package:pedilo_ya/datos/imagenes.dart';

class PaginaImg extends StatefulWidget {
  const PaginaImg({super.key});

  @override
  State<PaginaImg> createState() => _PaginImgState();
}

class _PaginImgState extends State<PaginaImg> {
  int indexImagenSeleccionada = -1;
  ListaImagenes listaimg = ListaImagenes();
  List<Imagenes> listimg = [];

  void funcionNavigatorBar(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaRegister(
                imagen: indexImagenSeleccionada == -1
                    ? ''
                    : listaimg.listaImg[indexImagenSeleccionada].imagen),
          ),
        );
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaginaRegister(imagen: ''),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Elija su foto de perfil'),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 50, right: 50),
          itemCount: listaimg.listaImg.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      disabledForegroundColor: Colors.transparent,
                      backgroundColor: index == indexImagenSeleccionada
                          ? Colors.yellow
                          : Colors.white,
                      shape: const CircleBorder(),
                      foregroundColor: Colors.transparent),
                  onPressed: () {
                    setState(() {
                      if (index == indexImagenSeleccionada) {
                        indexImagenSeleccionada = -1;
                      } else {
                        indexImagenSeleccionada = index;
                      }
                    });
                  },
                  child: Image.asset(
                    listaimg.listaImg[index].imagen,
                    height: 300,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.transparent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            label: 'Atras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Seleccionar',
          ),
        ],
        onTap: funcionNavigatorBar,
      ),
    );
  }
}
