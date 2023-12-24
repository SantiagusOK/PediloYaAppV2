import 'package:pedilo_ya/datos/comida.dart';

class Menu {
  List<Comida> listMenu = [
    Comida(
      nombre: 'Hamburguesa',
      precio: 230,
      imagen: 'lib/images/hamburguesa.jpg',
    ),
    Comida(
      nombre: 'Pancho',
      precio: 100,
      imagen: 'lib/images/pancho.jpg',
    ),
    Comida(
      nombre: 'Pizza Muzzarella',
      precio: 250,
      imagen: 'lib/images/pizza.jpg',
    ),
    Comida(
      nombre: 'Ravioles',
      precio: 230,
      imagen: 'lib/images/ravioles.jpg',
    ),
  ];
}
