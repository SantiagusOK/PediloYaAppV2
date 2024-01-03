import 'package:pedilo_ya/datos/tarjeta.dart';
import 'package:pedilo_ya/datos/usuario.dart';

class BaseDeDatos {
  List<Usuario> listBD = [
    Usuario(
        nombreCompleto: 'Agustin Zapata',
        nombreDeUsuario: 'Santiagus',
        contra: 'agus123',
        fotoPerfil: 'lib/images/imagenes_perfil/img2.png',
        direccion: '742 de Evergreen Terrace',
        comidaFavorito: [],
        comprasUsuario: [],
        listaCarrito: [],
        misTarjetas: []),
  ];
}
