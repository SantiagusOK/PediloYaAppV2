import 'dart:io';

import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/comprobante.dart';

class Usuario {
  String nombreCompleto;
  String nombreDeUsuario;
  String contra;
  String fotoPerfil;
  String direccion;
  List<ComidaCarrito> listaCarrito;
  List<Comprobante> comprasUsuario;
  List<Comida> comidaFavorito;
  //List<Tarjeta> tarjetas; ----- falta crear la clase tarjeta
  Usuario({
    this.nombreCompleto = '',
    this.nombreDeUsuario = '',
    this.contra = '',
    this.fotoPerfil = '',
    this.direccion = '',
    required this.comprasUsuario,
    required this.comidaFavorito,
    required this.listaCarrito,
    //this.tarjetas = const [],
  });
}
