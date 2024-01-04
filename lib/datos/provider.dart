import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/bd.dart';
import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/comprobante.dart';
import 'package:pedilo_ya/datos/datos.dart';
import 'package:pedilo_ya/datos/menu.dart';
import 'package:pedilo_ya/datos/tarjeta.dart';
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
    datosAdd.listaCarrito.clear();
  }

  void guardarComidaACarrito(ComidaCarrito newComida) {
    datosAdd.listaCarrito.add(newComida);
  }

  void guardarComidaAFavorito(Comida comida) {
    Comida newcomida = comida;
    datosAdd.usuario.comidaFavorito.add(newcomida);
  }

  void guardarComprobante(Comprobante comprobante) {
    usuario().comprasUsuario.add(comprobante);
    borrarCarrito();
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
        misTarjetas: []);
    bd.listBD.add(newUser);
  }

  int verificarLogin(String username, String pass) {
    bool nombre = false;
    bool contra = false;
    if (username.isEmpty || pass.isEmpty) {
      return 0;
    }
    if (username == 'datos' && pass == 'datos') {
      return -1;
    }

    for (int index = 0; index < bd.listBD.length; index++) {
      Usuario userVerifi = bd.listBD[index];
      if (userVerifi.nombreDeUsuario == username) {
        nombre = true;
      }
      if (userVerifi.contra == pass) {
        contra = true;
      }

      if (nombre && contra) {
        datosAdd.usuario = bd.listBD[index];
        return 3;
      } else if (nombre && contra == false || nombre == false && contra) {
        return 2;
      }
    }

    return 1;
  }

  int verificarRegistro(String nombre, String apellido, String username,
      String direccion, String pass, String pass2) {
    if (nombre.isEmpty ||
        apellido.isEmpty ||
        username.isEmpty ||
        direccion.isEmpty ||
        pass.isEmpty ||
        pass2.isEmpty) {
      return 0;
    }
    for (int index = 0; index < bd.listBD.length; index++) {
      Usuario userVerifi = bd.listBD[index];
      if (userVerifi.nombreDeUsuario == username) {
        return 1;
      }
    }
    if (pass != pass2) {
      return 2;
    }

    return 3;
  }

  Usuario usuario() {
    return datosAdd.usuario;
  }

  String cuantaComidaHay(Comprobante comprobante) {
    int total = comprobante.misCompras.length - 1;
    return '${comprobante.misCompras[0].nombre}, $total +';
  }

  int verificarDatosTarjeta(String nombre, int numero, int mes, int year) {
    List<Tarjeta> listaTarjeta = datosAdd.usuario.misTarjetas;
    for (int index = 0; index < listaTarjeta.length; index++) {
      if (listaTarjeta[index].numero == numero) {
        return 0;
      }
    }

    if (mes > 12 || mes < 1) {
      return 1;
    }

    if (year < 24) {
      return 2;
    } else if (year >= 24 && mes < 2) {
      return 25;
    }
    Tarjeta newTarjeta = Tarjeta(
        nombre: nombre,
        numero: numero,
        venciminetoMes: mes,
        vencimientoYear: year);
    datosAdd.usuario.misTarjetas.add(newTarjeta);
    return 3;
  }

  void borrarTarjeta(int index) {
    datosAdd.usuario.misTarjetas.removeAt(index);
  }
}
