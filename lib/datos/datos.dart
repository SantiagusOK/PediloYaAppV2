import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class DatosApp {
  int posicion = 0;

  /// 0 es menu, 1 es favorito
  Usuario usuario = Usuario(
      comidaFavorito: [],
      comprasUsuario: [],
      listaCarrito: [],
      misTarjetas: []);
  int posicionbd = 0;
  String nombreYApellido = '';
  String imagenUser = '';
  String direccionUser = '';
  List<ComidaCarrito> listaCarrito = [];
  List<ComidaCarrito> listaCarritoSaved = [];
  List comprobante = [''];
}
