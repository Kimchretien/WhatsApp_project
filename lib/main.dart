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

      body: ListView(
        children: [
       ElevatedButton(

      child: Text('Bouton  avec Elevation'),
      onPressed: (){

      },
       ),
       OutlinedButton(onPressed: (){}, child: Text("Boutton avec contour")),
        TextButton(onPressed: (){}, child: Text("Boutton simple")),
        IconButton(onPressed: (){}, icon: Icon(Icons.home))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      // body: pages[pagesIndex],
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     border: Border(
      //       top: BorderSide(color: Colors.grey, width: 0.2)
      //     )
      //   ),
      //   child: NavigationBar(
      //   selectedIndex: pagesIndex,
      //   onDestinationSelected: (int index){
      //     setState(() {
      //       pagesIndex=index;
      //     });

      //   },
      //   backgroundColor: Colors.white,
      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(Icons.chat),
      //        label: "Discussions"),
      //        NavigationDestination(
      //       icon: Icon(Icons.filter_tilt_shift),
      //        label: "Actus"),
      //        NavigationDestination(
      //       icon: Icon(Icons.groups),
      //        label: "communautes"),
      //        NavigationDestination(
      //       icon: Icon(Icons.call),
      //        label: "Appels"),

      //   ],
      // ),
      // )

  
      );
  }
}