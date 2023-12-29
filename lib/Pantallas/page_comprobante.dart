import 'package:flutter/material.dart';

class PaginaComprobante extends StatelessWidget {
  const PaginaComprobante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text('Comprobante aca'),
      ),
    );
  }
}
