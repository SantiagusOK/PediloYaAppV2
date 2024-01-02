import 'package:flutter/material.dart';

class Imagenes {
  String imagen;
  Imagenes({required this.imagen});
}

class ListaImagenes {
  List<Imagenes> listaImg = [
    Imagenes(imagen: 'lib/images/imagenes_perfil/img2.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img3.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img4.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img5.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img7.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img8.png'),
    Imagenes(imagen: 'lib/images/imagenes_perfil/img9.png'),
  ];
}
