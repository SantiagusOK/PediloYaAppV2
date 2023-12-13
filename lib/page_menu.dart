import 'package:comida_test/comida.dart';
import 'package:comida_test/page_comidaedit.dart';
import 'package:flutter/material.dart';

class PaginaMenu extends StatelessWidget {
  const PaginaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Menu menu = Menu();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        padding: const EdgeInsets.all(20),
        itemCount: menu.listaMenu().length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      //Comida comisaSeleccionada = menu.listaMenu()[index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaEdit(index: index)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            menu.comidaMenu[index].imagen,
                            fit: BoxFit.cover,
                            width: 400,
                            height: 250,
                          ),
                        ),
                        Text(
                          menu.comidaMenu[index].nombre,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 30),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${menu.comidaMenu[index].precio}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 30),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border_rounded,
                                  size: 50,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
