import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/datos.dart';

class Datos extends ChangeNotifier {
  DatosApp datosAdd = DatosApp();
  DatosApp get datosAddd => DatosApp();

  //FUNCIONES

  void guardarComidaACarrito(ComidaCarrito newComida) {
    datosAdd.listaCarrito.add(newComida);
  }

  List<ComidaCarrito> listaCarrito() {
    return datosAdd.listaCarrito;
  }

  int resultadoCarrito() {
    int totalCarrito = 0;
    for (int index = 0; index < datosAdd.listaCarrito.length; index++) {
      totalCarrito = totalCarrito + datosAdd.listaCarrito[index].precio;
    }
    return totalCarrito;
  }

  void borrarComidaDelCarrito(int index) {
    datosAdd.listaCarrito.removeAt(index);
  }
}
