import 'package:pedilo_ya/datos/comida_carrito.dart';

class Comprobante {
  String nombre;
  String direccion;
  List<ComidaCarrito> misCompras;
  String tipoDePago;
  int precioTotal;
  Comprobante({
    this.precioTotal = 0,
    this.nombre = '',
    this.direccion = '',
    this.misCompras = const [],
    this.tipoDePago = '',
  });
}
