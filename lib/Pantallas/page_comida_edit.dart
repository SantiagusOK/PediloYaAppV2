import 'package:pedilo_ya/Pantallas/page_carrito.dart';
import 'package:pedilo_ya/Pantallas/page_fav.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';
import 'package:pedilo_ya/datos/comida.dart';
import 'package:pedilo_ya/datos/comida_carrito.dart';
import 'package:pedilo_ya/datos/menu.dart';
import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaEdit extends StatefulWidget {
  const PaginaEdit({super.key, required this.comida});

  final Comida comida;
  @override
  State<PaginaEdit> createState() => _PaginaEditState();
}

class _PaginaEditState extends State<PaginaEdit> {
  Menu menu = Menu();
  int cantidad = 1;
  int precioEdit = 0;

  void realizarAccion(String accion) {
    switch (accion) {
      case 'c+':
        sumarCantidad();
      case 'c-':
        reducirCantidad();
    }
  }

  void sumarCantidad() {
    setState(() {
      cantidad++;
      precioEdit = cantidad * widget.comida.precio;
    });
  }

  void reducirCantidad() {
    setState(() {
      cantidad--;

      if (cantidad < 1) {
        cantidad = 1;
      } else {
        precioEdit = cantidad * widget.comida.precio;
      }
    });
  }

  @override
  void initState() {
    precioEdit = widget.comida.precio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Column(
              children: [
                //----------------------------------------------IMAGEN DE LA COMIDA
                ClipRRect(
                  child: Image.asset(
                    widget.comida.imagen,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140,
                  ),
                ),
                //----------------------------------------------NOMBRE DE LA COMIDA
                Text(
                  widget.comida.nombre,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                //----------------------------------------------CUADRO DE PRECIO
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //----------------------------------------------TEXT DEL PRECIO
                              const Text(
                                'Precio:',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              //----------------------------------------------PRECIO DE LA COMIDA
                              Text('\$$precioEdit',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        //----------------------------------------------CUADRO DE LA CANTIDAD
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(left: 15, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //----------------------------------------------TEXTO DE CANTIDAD
                              const Text(
                                'Cantidad:',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //----------------------------------------------BOTON -
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      surfaceTintColor: Colors.transparent,
                                    ),
                                    onPressed: () => realizarAccion('c-'),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  //---------------------------------------------- CANTIDAD NUMERO
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    child: Text('x$cantidad',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  //----------------------------------------------BOTON +
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      surfaceTintColor: Colors.transparent,
                                    ),
                                    onPressed: () => realizarAccion('c+'),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //----------------------------------------------BARRA DE OPCIONES DE ABAJO
          bottomNavigationBar: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //----------------------------------------------BOTON DE CANCELAR
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaginaMenu()));
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close),
                        Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                //----------------------------------------------BOTON DE CARRITO
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      //aca crea un objeto de ComidaCarrito, para luego guardarlo en la listaCarrito de la App
                      ComidaCarrito newComida = ComidaCarrito(
                          nombre: widget.comida.nombre,
                          precio: precioEdit,
                          cantidad: cantidad,
                          imagen: widget.comida.imagen);
                      datos.guardarComidaACarrito(newComida);
                      if (datos.posicion() == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaginaMenu(),
                            ));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaginaFavorito(),
                            ));
                      }
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_shopping_cart_rounded),
                        Text('Carrito'),
                      ],
                    ),
                  ),
                ),
                //----------------------------------------------BOTON DE COMPRAR
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      //aca crea un objeto de ComidaCarrito, para luego guardarlo en la listaCarrito de la App
                      ComidaCarrito newComida = ComidaCarrito(
                          nombre: widget.comida.nombre,
                          precio: precioEdit,
                          cantidad: cantidad,
                          imagen: widget.comida.imagen);
                      datos.guardarComidaACarrito(newComida);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaginaCarrito(),
                        ),
                      );
                      //datos.mostrarListaCarrito();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Text('Comprar'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
