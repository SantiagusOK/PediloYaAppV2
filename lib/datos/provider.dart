import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/bd.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/datos.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class Datos extends ChangeNotifier {
  DatosApp datosAdd = DatosApp();
  DatosApp get datosAddd => DatosApp();

  BaseDeDatos bd = BaseDeDatos();
  BaseDeDatos get bds => BaseDeDatos();

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

  void guardarNuevoUsuario(String nombre, String apellido, String username,
      String direccion, String pass, String fotoPerfil) {
    Usuario newUser = Usuario(
        nombreCompleto: '$nombre $apellido',
        nombreDeUsuario: username,
        direccion: direccion,
        contra: pass,
        fotoPerfil: fotoPerfil);
    bd.listBD.add(newUser);
  }

  bool verificarLogin(String username, String pass) {
    if (username.isEmpty || pass.isEmpty) {
      return false;
    }

    for (int index = 0; index < bd.listBD.length; index++) {
      int a = 0;
      Usuario userVerifi = bd.listBD[index];

      if (userVerifi.nombreDeUsuario != username && userVerifi.contra != pass) {
        a++;
        print(
            '----------------------------------------------$index----------------------------------------------');
        if (a == bd.listBD.length) {
          return false;
        }
      } else {
        datosAdd.usuario = bd.listBD[index];
        return true;
      }
    }

    return true;
  }

  bool verificarRegistro(String username, String pass, String pass2) {
    if (username.isEmpty || pass.isEmpty) {
      return false;
    }
    if (pass != pass2) {
      return false;
    }
    for (int index = 0; index < bd.listBD.length; index++) {
      Usuario userVerifi = bd.listBD[index];
      if (userVerifi.nombreDeUsuario == username) {
        return false;
      }
    }
    return true;
  }

  Usuario usuario() {
    return datosAdd.usuario;
  }
}
