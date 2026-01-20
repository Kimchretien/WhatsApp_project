import 'package:appli01/messages/messages.dart';
import 'package:flutter/material.dart';
import 'package:appli01/pages/actus.dart';
import 'package:appli01/pages/communautes.dart';
import 'package:appli01/pages/Appels.dart';
import 'package:appli01/pages/discussions.dart';
import 'package:camera/camera.dart';
import 'dart:io';

// Liste globale pour les caméras
List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras(); // Récupère toutes les caméras disponibles
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  XFile? _image;

  final pages = [
    DiscussionsPage(conversations: conversations),
    ActusPage(),
    CommunautesPage(),
    AppelsPage(),
  ];

  int pagesIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initialise la première caméra disponible
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _initializeControllerFuture = _controller!.initialize();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Fonction pour prendre une photo
  Future<void> prendrePhoto() async {
    if (_controller == null || _initializeControllerFuture == null) return;

    try {
      await _initializeControllerFuture!;
      final XFile image = await _controller!.takePicture();
      setState(() {
        _image = image;
      });
      print("Photo prise : ${image.path}");
    } catch (e) {
      print("Erreur caméra : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 18.0,
        title: const Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: prendrePhoto, // 📸 La fonction caméra
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Toutes")),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {}, child: const Text("Non lues")),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {}, child: const Text("Favoris")),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: () {}, child: const Text("Groupe")),
                ],
              ),
            ),
          ),
          Expanded(
            child: _image != null
                ? Image.file(File(_image!.path)) // Affiche la photo prise
                : pages[pagesIndex],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ),
        child: NavigationBar(
          selectedIndex: pagesIndex,
          onDestinationSelected: (int index) {
            setState(() {
              pagesIndex = index;
            });
          },
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.chat), label: "Discussions"),
            NavigationDestination(icon: Icon(Icons.filter_tilt_shift), label: "Actus"),
            NavigationDestination(icon: Icon(Icons.groups), label: "Communautés"),
            NavigationDestination(icon: Icon(Icons.call), label: "Appels"),
          ],
        ),
      ),
    );

    
  }
}
