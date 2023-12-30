import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedilo_ya/Pantallas/page.imagenes.dart';
import 'package:pedilo_ya/datos/datos.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaRegister extends StatefulWidget {
  const PaginaRegister({super.key});

  @override
  State<PaginaRegister> createState() => _PaginaRegisterState();
}

class _PaginaRegisterState extends State<PaginaRegister> {
  String? fotoBits;
  late File fotoPerfil;
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlUsername = TextEditingController();
  TextEditingController controlDireccion = TextEditingController();
  TextEditingController controlPass1 = TextEditingController();
  TextEditingController controlPass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(builder: (context, datos, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Registrarse',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //--------------------------------------------BOTON DE LA CAMARA
                  /*Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 150),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png',
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                      const Text('Foto de perfil')
                    ],
                  ),
                  const SizedBox(height: 20),
                  //--------------------------------------------TEXTFIELD DE NOMBRE Y APELLIDO
                  */
                  Row(
                    children: [
                      //-------------------------------------------- NOMBRE
                      Expanded(
                        child: TextField(
                          controller: controlNombre,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nombre',
                          ),
                        ),
                      ),
                      //-------------------------------------------- APELLIDO
                      Expanded(
                        child: TextField(
                          controller: controlApellido,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Apellido',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controlUsername,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nombre de usuario',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controlDireccion,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Direccion',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controlPass1,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Contraseña',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controlPass2,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Repetir Contraseña',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (datos.verificarRegistro(controlUsername.text,
                          controlPass1.text, controlPass2.text)) {
                        datos.guardarNuevoUsuario(
                            controlNombre.text,
                            controlApellido.text,
                            controlUsername.text,
                            controlDireccion.text,
                            controlPass1.text,
                            fotoBits!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cuenta creada con exito'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ERROR: verifique bien los datos'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Listo',
                      style: TextStyle(
                          fontSize: 30, color: Color.fromARGB(255, 4, 156, 83)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
