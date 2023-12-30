import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_welcome.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  TextEditingController controlUsername = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Datos>(builder: (context, datos, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            'Iniciar Sesion',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controlUsername,
                              decoration: const InputDecoration(
                                hintText: 'Nombre de usuario',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              controller: controlPass,
                              decoration: const InputDecoration(
                                hintText: 'Contraseña',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (datos.verificarLogin(
                          controlUsername.text, controlPass.text)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaginaWelcome()));
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
                      'Iniciar Sesion',
                      style: TextStyle(color: Colors.black, fontSize: 20),
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
