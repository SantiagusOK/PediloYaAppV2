import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_crear_tarjeta.dart';
import 'package:pedilo_ya/Pantallas/page_resultado.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/tarjeta.dart';
import 'package:provider/provider.dart';

class PaginaTarjetas extends StatefulWidget {
  const PaginaTarjetas({super.key});

  @override
  State<PaginaTarjetas> createState() => _PaginaTarjetasState();
}

class _PaginaTarjetasState extends State<PaginaTarjetas> {
  int tarjetaSeleccionada = -1;

  void mostrarSnakbar(String mensajeError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensajeError),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(
      builder: (context, datos, child) {
        List<Tarjeta> tarjetas = datos.usuario().misTarjetas;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text(
              'Tarjetas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  height: 300,
                  child: tarjetas.isNotEmpty
                      ? ListView.separated(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: tarjetas.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 390,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        index == tarjetaSeleccionada
                                            ? Colors.grey
                                            : Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  setState(() {
                                    if (index != tarjetaSeleccionada) {
                                      tarjetaSeleccionada = index;
                                    } else {
                                      tarjetaSeleccionada = -1;
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 60,
                                      left: 0,
                                      child: Image.asset('lib/images/chip.png',
                                          height: 80),
                                    ),
                                    Positioned(
                                      top: 100,
                                      left: 240,
                                      child: Text(tarjetas[index].tipo,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                    Positioned(
                                      top: 140,
                                      child: Text('${tarjetas[index].numero}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 34)),
                                    ),
                                    Positioned(
                                      top: 187,
                                      left: 0,
                                      child: Text(
                                          '${tarjetas[index].venciminetoMes} / ${tarjetas[index].vencimientoYear}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                    Positioned(
                                      top: 210,
                                      child: Text(tarjetas[index].nombre,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text('No tienes tarjetas guardadas'),
                        ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromWidth(500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaginaCrearTarjeta()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Añadir una Tarjeta',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromWidth(500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      if (tarjetaSeleccionada == -1) {
                        mostrarSnakbar('No has seleccionado ninguna tarjeta');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaginaResultado(
                                    tipoDePago: 'Tarjeta')));
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Seleccionar Tarjeta',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromWidth(500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () {
                      if (tarjetaSeleccionada == -1) {
                        mostrarSnakbar(
                            'Seleccione una tarje para poder borrarla');
                      } else {
                        setState(() {
                          datos.borrarTarjeta(tarjetaSeleccionada);
                          tarjetaSeleccionada = -1;
                        });
                        mostrarSnakbar('Se borro una tarjeta');
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Eliminar Tarjeta',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
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
