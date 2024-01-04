import 'package:pedilo_ya/datos/comida.dart';

import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/tarjeta.dart';

class Usuario {
  String nombreCompleto;
  String nombreDeUsuario;
  String contra;
  String fotoPerfil;
  String direccion;
  List<Comprobante> comprasUsuario;
  List<Comida> comidaFavorito;
  List<Tarjeta> misTarjetas;
  Usuario({
    this.nombreCompleto = '',
    this.nombreDeUsuario = '',
    this.contra = '',
    this.fotoPerfil = '',
    this.direccion = '',
    required this.comprasUsuario,
    required this.comidaFavorito,
    required this.misTarjetas,
  });
}
