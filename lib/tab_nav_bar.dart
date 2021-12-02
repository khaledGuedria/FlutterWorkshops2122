import 'package:flutter/material.dart';
import 'package:workshop_sim4/custom_drawer.dart';
import 'package:workshop_sim4/home.dart';
import 'package:workshop_sim4/new_home.dart';
import 'package:workshop_sim4/panier.dart';
import 'package:workshop_sim4/tabbar_custom_drawer.dart';

class MyTabbar extends StatefulWidget {
  const MyTabbar({Key? key}) : super(key: key);

  @override
  _MyTabbarState createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('G-Store Esprit'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.store), text: 'Store',),
            Tab(icon: Icon(Icons.library_books), text: 'Bibliothèque',),
            Tab(icon: Icon(Icons.shopping_basket), text: 'Panier',),
          ]),
        ),
        drawer: TabbarCustomDrawer(),
        body: TabBarView(children: [
          Home(), NewHome(), Panier()
        ],),
      ),
    );
  }
}
