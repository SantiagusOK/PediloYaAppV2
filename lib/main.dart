import 'package:pedilo_ya/Pantallas/page_inicio.dart';
import 'package:flutter/material.dart';
import 'package:pedilo_ya/datos/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Datos(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pedilo Ya',
      home: PaginaInicio(),
    );
  }
}
