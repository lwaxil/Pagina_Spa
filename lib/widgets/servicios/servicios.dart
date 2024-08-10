import 'package:flutter/material.dart';
import '../modal_navbar.dart';
import '../navbar.dart';


class Servicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Altura del NavBar
        child: NavBar(), // Usa el NavBar como appBar
      ),
      body: Center(child: Text('Página de Servicios')),
      endDrawer: ModalNavBar(), // Usa el ModalNavBar
    );
  }
}
