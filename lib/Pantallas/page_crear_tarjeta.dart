import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_resultado.dart';
import 'package:pedilo_ya/Pantallas/page_tarjetas.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:pedilo_ya/datos/tarjeta.dart';
import 'package:provider/provider.dart';

class PaginaCrearTarjeta extends StatefulWidget {
  const PaginaCrearTarjeta({super.key});

  @override
  State<PaginaCrearTarjeta> createState() => _PaginaCrearTarjetaState();
}

class _PaginaCrearTarjetaState extends State<PaginaCrearTarjeta> {
  TextEditingController controlNumero = TextEditingController();
  TextEditingController controlMes = TextEditingController();
  TextEditingController controlYear = TextEditingController();
  TextEditingController controlNombre = TextEditingController();

  String numeroWidget = '';
  String mesWidget = '';
  String yearWidget = '';
  String nombreWidget = '';

  bool activarBoton = false;
  bool activarBotonAceptar = false;

  int posicion = 0;

  void mostrarSnakbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error: datos mal cargados, o tarjeta ya cargada'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void cambiarPosicion(String decision) {
    switch (decision) {
      case 'v+':
        setState(() {
          posicion++;
          activarBoton = false;
          if (posicion == 4) {
            posicion = 3;
          }
        });
      case 'v-':
        setState(() {
          activarBoton = true;
          posicion--;
          if (posicion < 0) {
            posicion = 0;
          }
        });
    }
  }

  TextField mostrarTexfield(int posicion) {
    switch (posicion) {
      case 1:
        if (mesWidget.length == 2) {
          activarBoton = true;
        } else {
          activarBoton = false;
        }

        /// MES DE VENCIMIENTO
        return TextField(
          maxLength: 2,
          controller: controlMes,
          onChanged: (valor) {
            setState(() {
              mesWidget = valor;
              if (valor.length == 2) {
                activarBoton = true;
              } else {
                activarBoton = false;
              }
            });
          },
          decoration: const InputDecoration(
            counterText: '',
            hintText: 'Mes de Vencimiento',
            border: OutlineInputBorder(),
          ),
        );
      case 2:
        if (yearWidget.length == 2) {
          activarBoton = true;
        } else {
          activarBoton = false;
        }

        /// AÑO DE VENCIMIENTO
        return TextField(
          controller: controlYear,
          maxLength: 2,
          onChanged: (valor) {
            setState(() {
              yearWidget = valor;
              if (valor.length == 2) {
                activarBoton = true;
              } else {
                activarBoton = false;
              }
            });
          },
          decoration: const InputDecoration(
            counterText: '',
            hintText: 'Año de vencimiento',
            border: OutlineInputBorder(),
          ),
        );
      case 3:

        /// AÑO DE VENCIMIENTO
        return TextField(
          maxLength: 23,
          controller: controlNombre,
          onChanged: (valor) {
            setState(() {
              nombreWidget = valor;
              if (valor.length > 14) {
                activarBotonAceptar = true;
              } else {
                activarBotonAceptar = false;
              }
            });
          },
          decoration: const InputDecoration(
            counterText: '',
            hintText: 'Nombre y apellido',
            border: OutlineInputBorder(),
          ),
        );
    }
    return TextField(
      controller: controlNumero,
      maxLength: 16,
      onChanged: (valor) {
        setState(() {
          numeroWidget = valor;
          if (valor.length == 16) {
            activarBoton = true;
          } else {
            activarBoton = false;
          }
        });
      },
      decoration: const InputDecoration(
        counterText: '',
        hintText: 'Numero',
        border: OutlineInputBorder(),
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
              'Crear Tarjetas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  width: 390,
                  height: 270,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 0,
                        child: Image.asset('lib/images/chip.png', height: 80),
                      ),
                      Positioned(
                        top: 140,
                        child: Text(controlNumero.text,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 34)),
                      ),
                      Positioned(
                        top: 187,
                        left: 0,
                        child: Text('${controlMes.text} / ${controlYear.text}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ),
                      Positioned(
                        top: 210,
                        child: Text(controlNombre.text,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24)),
                      ),
                    ],
                  ),
                ),
                //////////////////////////////////////////////////////////////////// TEXTFIELES
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //////////////////////////////////////////////////////////////////// NUMERO
                      mostrarTexfield(posicion),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => cambiarPosicion('v-'),
                            icon: const Icon(
                              Icons.keyboard_arrow_left_rounded,
                              size: 50,
                            ),
                          ),
                          IconButton(
                            onPressed: activarBoton
                                ? () => cambiarPosicion('v+')
                                : null,
                            icon: Icon(
                              posicion > 3
                                  ? Icons.check
                                  : Icons.keyboard_arrow_right_rounded,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                      Text('$posicion'),
                      ElevatedButton(
                        onPressed: () {
                          if (datos.verificarDatosTarjeta(
                              nombreWidget,
                              int.parse(numeroWidget),
                              int.parse(mesWidget),
                              int.parse(yearWidget))) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaginaTarjetas()));
                          } else {
                            mostrarSnakbar();
                          }
                        },
                        child: Text('Aceptar'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
