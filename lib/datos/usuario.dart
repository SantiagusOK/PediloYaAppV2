import 'dart:io';

import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';

class Usuario {
  String nombreCompleto;
  String nombreDeUsuario;
  String contra;
  String fotoPerfil;
  String direccion;
  List<ComidaCarrito> comprasUsuario;
  List<Comida> comidaFavorito;
  //List<Tarjeta> tarjetas; ----- falta crear la clase tarjeta
  Usuario({
    this.nombreCompleto = '',
    this.nombreDeUsuario = '',
    this.contra = '',
    this.fotoPerfil = '',
    this.direccion = '',
    this.comprasUsuario = const [],
    this.comidaFavorito = const [],
    //this.tarjetas = const [],
  });
}
