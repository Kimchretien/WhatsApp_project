 import 'package:flutter/material.dart';
 import 'package:appli01/pages/actus.dart';
 import 'package:appli01/pages/communautes.dart';
 import 'package:appli01/pages/Appels.dart';
 import 'package:appli01/pages/discussions.dart';


void main() {
  // Entry point of the application
  runApp( MaterialApp(
    theme: ThemeData(
      colorSchemeSeed: Colors.green,
      scaffoldBackgroundColor: Colors.white

    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}




class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
  //ou createState(){ return HomePageState();} 
}

 //navigationBar de WhatsApp

class HomePageState extends State<HomePage>{

 final pages=[
    DiscussionsPage(),
    ActusPage(),
    CommunautesPage(),
    AppelsPage(),
  ];

  int pagesIndex=0;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      // body: ListView(
      //   children: [
      //  ElevatedButton(

      // child: Text('Bouton  avec Elevation'),
      // onPressed: (){

      // },
      //  ),
      //  OutlinedButton(onPressed: (){}, child: Text("Boutton avec contour")),
      //   TextButton(onPressed: (){}, child: Text("Boutton simple")),
      //   IconButton(onPressed: (){}, icon: Icon(Icons.home))
      //   ],
      // ),
      
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 🔹 ESPACE EN HAUT
      const SizedBox(height: 20),

      // 🔹 BOUTONS ALIGNÉS SUR UNE LIGNE
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12), // Ajoute un padding horizontal de 12 pixels
        child: SingleChildScrollView( // Permet le défilement horizontal si nécessaire
          scrollDirection: Axis.horizontal, // Définit la direction de défilement sur horizontal
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Toutes"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Non lues"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Favoris"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Groupe"),
              ),
            ],
          ),
        ),
      ),

      // 🔹 CONTENU PRINCIPAL
      Expanded(
        child: pages[pagesIndex],
      ),
    ],
  ),

  // 🔹 BOUTON FLOTTANT
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    child: const Icon(Icons.chat),
  ),

  // 🔹 BARRE DE NAVIGATION EN BAS
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
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: "Discussions",
        ),
        NavigationDestination(
          icon: Icon(Icons.filter_tilt_shift),
          label: "Actus",
        ),
        NavigationDestination(
          icon: Icon(Icons.groups),
          label: "Communautés",
        ),
        NavigationDestination(
          icon: Icon(Icons.call),
          label: "Appels",
        ),
      ],
    ),
  ),
);

  }}