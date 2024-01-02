import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/bd.dart';
import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/datos.dart';
import 'package:pedilo_ya/datos/menu.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class Datos extends ChangeNotifier {
  DatosApp datosAdd = DatosApp();
  DatosApp get datosAddd => DatosApp();

  BaseDeDatos bd = BaseDeDatos();
  BaseDeDatos get bds => BaseDeDatos();

  //FUNCIONES
  void cambiarPosicion(int posicion) {
    datosAdd.posicion = posicion;
  }

  int posicion() {
    return datosAdd.posicion;
  }

  void borrarCarrito() {
    datosAdd.usuario.listaCarrito.clear();
  }

  void guardarComidaACarrito(ComidaCarrito newComida) {
    datosAdd.usuario.listaCarrito.add(newComida);
  }

  void guardarComidaAFavorito(Comida comida) {
    Comida newcomida = comida;
    datosAdd.usuario.comidaFavorito.add(newcomida);
  }

  void guardarComprobante(Comprobante comprobante) {
    usuario().comprasUsuario.add(comprobante);
    borrarCarrito();
    print('Lista carrito: ${usuario().listaCarrito.length}');
  }

  void borrarComidaAFavorito(int indexFavorito, int posicion) {
    Menu menu = Menu();

    if (posicion == 0) {
      for (int index = 0; index < usuario().comidaFavorito.length; index++) {
        for (int index2 = 0; index < menu.listMenu.length; index2++) {
          if (menu.listMenu[index2].nombre ==
              usuario().comidaFavorito[index].nombre) {
            usuario().comidaFavorito.removeAt(index);
            return;
          }
        }
      }
    } else {
      usuario().comidaFavorito.removeAt(indexFavorito);
    }
  }

  bool comidaEnFavorito(int indexMenu) {
    Menu menu = Menu();
    String comidaMenu = menu.listMenu[indexMenu].nombre;

    for (int index = 0; index < usuario().comidaFavorito.length; index++) {
      if (usuario().comidaFavorito[index].nombre == comidaMenu) {
        return true;
      }
    }
    return false;
  }

  List<ComidaCarrito> listaCarrito() {
    return datosAdd.usuario.listaCarrito;
  }

  int resultadoCarrito() {
    int totalCarrito = 0;
    for (int index = 0; index < datosAdd.usuario.listaCarrito.length; index++) {
      totalCarrito = totalCarrito + datosAdd.usuario.listaCarrito[index].precio;
    }
    return totalCarrito;
  }

  void borrarComidaDelCarrito(int index) {
    datosAdd.usuario.listaCarrito.removeAt(index);
  }

  void guardarCarritoASaved() {
    datosAdd.listaCarritoSaved = datosAdd.listaCarrito;
  }

  void guardarNuevoUsuario(String nombre, String apellido, String username,
      String direccion, String pass, String fotoPerfil) {
    Usuario newUser = Usuario(
        nombreCompleto: '$nombre $apellido',
        nombreDeUsuario: username,
        direccion: direccion,
        contra: pass,
        fotoPerfil: fotoPerfil,
        comidaFavorito: [],
        comprasUsuario: [],
        listaCarrito: []);
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
