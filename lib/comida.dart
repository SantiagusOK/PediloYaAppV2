class Comida {
  String nombre;
  int precio;
  String imagen;
  Comida({this.nombre = 'nada', this.precio = 0, this.imagen = 'nada'});
  @override
  String toString() {
    return '$nombre \$$precio';
  }

  String nombreComida() {
    return nombre;
  }

  int precioComida() {
    return precio;
  }
}

class Menu {
  List<Comida> comidaMenu = [
    Comida(
      nombre: 'Pancho',
      precio: 200,
      imagen: 'assets/pancho.jpg',
    ),
    Comida(
      nombre: 'Pizza',
      precio: 300,
      imagen: 'assets/pizza.jpg',
    ),
    Comida(
      nombre: 'Hamburguesa',
      precio: 250,
      imagen: 'assets/hamburguesa.jpg',
    ),
    Comida(
      nombre: 'Ravioles',
      precio: 200,
      imagen: 'assets/ravioles.jpg',
    )
  ];

  void mostrarMenu() {
    for (int i = 0; i < comidaMenu.length; i++) {
      // ignore: avoid_print
      print(comidaMenu[i]);
    }
  }

  void agregarNuevaComida(Comida newComida) {
    comidaMenu.add(newComida);
  }

  List<Comida> listaMenu() {
    return comidaMenu;
  }
}
