import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PaginaRegister extends StatefulWidget {
  const PaginaRegister({super.key});

  @override
  State<PaginaRegister> createState() => _PaginaRegisterState();
}

class _PaginaRegisterState extends State<PaginaRegister> {
  @override
  Widget build(BuildContext context) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 150),
                          backgroundColor: Colors.white),
                      onPressed: () {},
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
                const Row(
                  children: [
                    //-------------------------------------------- NOMBRE
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nombre',
                        ),
                      ),
                    ),
                    //-------------------------------------------- APELLIDO
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Apellido',
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nombre de usuario',
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Direccion',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
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
                            obscureText: true,
                            decoration: InputDecoration(
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
                  onPressed: () {},
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
  }
}
