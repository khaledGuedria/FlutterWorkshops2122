import 'package:flutter/material.dart';
import 'package:workshop_sim4/custom_drawer.dart';
import 'package:workshop_sim4/home.dart';
import 'package:workshop_sim4/new_home.dart';
import 'package:workshop_sim4/panier.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({ Key? key }) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  //var
  int _mIndex = 0;
  List<Widget> interfaces = [Home(), NewHome(), Panier()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G-Store Esprit'),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _mIndex,
        onTap: (value) { //0 - 1 - 2
          setState(() {
            _mIndex = value;
          });
        },
        items: [
        //1
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        //2
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Bibliothèque'),
        //3
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Panier'),
        ],
      ),
      body: interfaces[_mIndex],
    );
  }
}