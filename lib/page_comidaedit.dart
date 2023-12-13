import 'package:comida_test/comida.dart';
import 'package:comida_test/page_menu.dart';
import 'package:flutter/material.dart';

class PaginaEdit extends StatefulWidget {
  const PaginaEdit({super.key, required this.index});
  final int index;
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
        precioEdit = cantidad * menu.comidaMenu[widget.index].precio;
      case 'c-':
        reducirCantidad();
        precioEdit = cantidad * menu.comidaMenu[widget.index].precio;
    }
  }

  void sumarCantidad() {
    setState(() {
      cantidad++;
    });
  }

  void reducirCantidad() {
    setState(() {
      cantidad--;
      if (cantidad < 1) {
        cantidad = 1;
      }
    });
  }

  @override
  void initState() {
    Menu menu = Menu();
    precioEdit = menu.comidaMenu[widget.index].precio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          width: 1100,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 1000,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    menu.comidaMenu[widget.index].imagen,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                menu.comidaMenu[widget.index].nombre,
                style: const TextStyle(fontSize: 50),
              ),
              Container(
                width: 1000,
                height: 85,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Cantidad',
                      style: TextStyle(fontSize: 30),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /////////////////////////////////////////////////////// BOTON PARA AUMENTAR CANTIDAD //////////////
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(4, 4),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              surfaceTintColor: Colors.transparent,
                            ),
                            onPressed: () {
                              realizarAccion('c+');
                            },
                            child: const Icon(Icons.arrow_drop_up_rounded)),
                        Text(
                          'x$cantidad',
                          style: const TextStyle(fontSize: 20),
                        ),
                        /////////////////////////////////////////////////////// BOTON PARA DESCREMENTAR CANTIDAD //////////////
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(4, 4),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {
                              realizarAccion('c-');
                            },
                            child: const Icon(Icons.arrow_drop_down_rounded)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 1000,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Precio:', style: TextStyle(fontSize: 30)),
                    Text('\$$precioEdit', style: const TextStyle(fontSize: 30)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 1000,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaginaMenu()));
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                            )),
                        const Text('Cancelar', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart,
                              size: 30,
                            )),
                        const Text('Agregar al carrito',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check,
                              size: 30,
                            )),
                        const Text('Comprar', style: TextStyle(fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
