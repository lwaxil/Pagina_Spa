import 'package:flutter/material.dart';
import 'dart:async';
import 'package:infinite_carousel/infinite_carousel.dart';
import '../modal_navbar.dart';
import '../navbar.dart';
import '../inicio/testimonios.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<String> images = [
    "assets/images/drenaje_linfatico.jpg",
    "assets/images/facial.jpg",
    "assets/images/masajes.jpg",
    "assets/images/podoestetica.jpg",
    "assets/images/ventosas.jpg",
    "assets/images/depilacion_laser.png",
  ];

  final InfiniteScrollController _carouselController = InfiniteScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Configurar el desplazamiento automático
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _carouselController.nextItem(); // Mueve al siguiente elemento
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Detiene el temporizador cuando la pantalla se destruye
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Altura del NavBar
        child: NavBar(), // Usa el NavBar como appBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Banner en la parte superior
            Container(
              height: 150, // Ajusta la altura del banner según sea necesario
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpeg'), // Cambia la ruta de la imagen según corresponda
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  // Logo a la izquierda
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/images/logo_spa.png', // Cambia la ruta del logo según corresponda
                      width: 150, // Ajusta el ancho del logo según sea necesario
                      height: 150, // Ajusta la altura del logo según sea necesario
                    ),
                  ),
                  // Texto del banner a la derecha del logo
                  Expanded(
                    child: Center(
                      child: Text(
                        'Bienvenido a Sentirse Bien', // Texto del banner
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // El ListView ocupa el espacio restante debajo del banner
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Margen lateral
                    child: Column(
                      children: [
                        // Carrusel de imágenes
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 147, 181).withOpacity(0.9), // Fondo del contenedor con opacidad
                            borderRadius: BorderRadius.circular(15), // Bordes redondeados
                          ),
                          height: 450, // Ajusta la altura según sea necesario
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2, // Ocupa la primer mitad del espacio
                                child: InfiniteCarousel.builder(
                                  controller: _carouselController,
                                  itemCount: images.length,
                                  itemExtent: 400,
                                  center: true,
                                  anchor: 0.0,
                                  velocityFactor: 0.5,
                                  onIndexChanged: (index) {
                                    print('index: $index');
                                  },
                                  itemBuilder: (context, itemIndex, realIndex) {
                                    return Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        images[itemIndex],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Buscamos atraer la atención de nuestros clientes a través de experiencias inspiradas en la seducción de los sentidos. Adaptamos las propuestas con el objetivo de que logre desconectarse completamente de la rutina y disfrute de un momento de bienestar, en total armonía con la naturaleza.',
                                        style: TextStyle(color: Colors.white, fontSize: 28),
                                        textAlign: TextAlign.justify,
                                        maxLines: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20), // Espacio entre el carrusel y el formulario

                        // Formulario visual para dejar un testimonio y sección de testimonios pre-cargados
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 147, 181).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Formulario a la izquierda
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cuentanos tu experiencia',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Nombre',
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const TextField(
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        labelText: 'Testimonio',
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Implementación futura para enviar el testimonio
                                        },
                                        child: Text('Enviar'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20), // Espacio entre el formulario y los testimonios

                              // Testimonios pre-cargados a la derecha
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Testimonios',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TestimonialWidget(
                                      name: 'María G.',
                                      text: 'El mejor spa que he visitado. Los tratamientos son increíbles y el personal es muy profesional.',
                                    ),
                                    const SizedBox(height: 16),
                                    TestimonialWidget(
                                      name: 'Carlos P.',
                                      text: 'Me sentí completamente renovado después del masaje descontracturante. ¡Altamente recomendado!',
                                    ),
                                    const SizedBox(height: 16),
                                    TestimonialWidget(
                                      name: 'Lucía R.',
                                      text: 'El ambiente es muy relajante, y los tratamientos faciales me dejaron la piel increíblemente suave.',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20), // Espacio entre el formulario y la sección de contacto

                        // Sección de contacto
                        Container(
                          color: const Color.fromARGB(255, 205, 72, 117),
                          height: 300, // Ajusta la altura según sea necesario
                          width: double.infinity,
                          child: const Center(
                            child: Text('Contáctanos', style: TextStyle(color: Colors.white, fontSize: 60)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: ModalNavBar(), // Usa el ModalNavBar
    );
  }
}


