import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class DatosApp {
  Usuario usuario = Usuario();
  int posicionbd = 0;
  String nombreYApellido = '';
  String imagenUser = '';
  String direccionUser = '';
  List<ComidaCarrito> listaCarrito = [];
  List comprobante = [''];
}
