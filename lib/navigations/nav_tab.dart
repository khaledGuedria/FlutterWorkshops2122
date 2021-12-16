import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop_sim4/basket/basket.dart';
import 'package:workshop_sim4/home/home.dart';
import 'package:workshop_sim4/my_games/my_games.dart';

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {

  //var
  late String _username;

  //life cycle
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs){
      setState(() {
        _username = prefs.getString('username')!;
      });
    });
  }

  //build
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Store",
              ),
              Tab(
                icon: Icon(Icons.article),
                text: "Bibliothèque",
              ),
              Tab(
                icon: Icon(Icons.shopping_basket_rounded),
                text: "Panier",
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                title: Text("Hello $_username"),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Modifier profil")
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/home/updateUser");
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.vertical_align_bottom),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Navigation du bas")
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Se déconnecter")
                  ],
                ),
                onTap: () {
                  SharedPreferences.getInstance().then((prefs){
                    //prefs.clear();
                    prefs.remove('username');
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  });
                },
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Home(), MyGames(), Basket()
          ],
        ),
      ),
    );
  }
}
