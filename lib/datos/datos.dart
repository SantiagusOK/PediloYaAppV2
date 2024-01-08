import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class DatosApp {
  /// 0 es menu, 1 es favorito
  Usuario usuario =
      Usuario(comidaFavorito: [], comprasUsuario: [], misTarjetas: []);
  int posicionbd = 0;
  List<ComidaCarrito> listaCarrito = [];
}
