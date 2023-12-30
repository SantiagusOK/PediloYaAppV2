import 'package:flutter/material.dart';
import 'package:pedilo_ya/Pantallas/page_menu.dart';

class PaginaWelcome extends StatefulWidget {
  const PaginaWelcome({super.key});

  @override
  State<PaginaWelcome> createState() => _PaginaWelcomeState();
}

class _PaginaWelcomeState extends State<PaginaWelcome> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PaginaMenu()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://snworksceo.imgix.net/dth/84e832cc-b853-40d1-bcf9-bd0d2aae2bec.sized-1000x1000.png?w=800&h=600',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              'TITO CALDERON',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'BIENVENIDO',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
