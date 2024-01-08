import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_comida_edit.dart';
import 'package:pedilo_ya/datos/comida.dart';

// ignore: must_be_immutable
class BotonesComida extends StatefulWidget {
  Comida comida;
  BotonesComida({super.key, required this.comida});

  @override
  State<BotonesComida> createState() => _BotonesComidaState();
}

class _BotonesComidaState extends State<BotonesComida> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(143, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // IMAGEN
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(widget.comida.imagen,
                  fit: BoxFit.cover, width: 400, height: 300)),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOMBRE
                    Text(widget.comida.nombre,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    // PRECIO
                    Text(
                      '\$ ${widget.comida.precio}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                // BOTON DE ACCIÓN
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(12)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaginaEdit(comida: widget.comida)));
                    },
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
