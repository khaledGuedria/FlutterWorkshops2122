import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:workshop_sim4/home/home.dart';
import 'element_info.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  //var
  int total = 0;
  late Future<bool> fetchedItems;
  List<GameData> basketGames = [];

  //actions
  Future<bool> getBasketItems() async {
    Database database = await openDatabase(
        join(await getDatabasesPath(), 'gstore_esprit_database.db'));
    List<Map<String, dynamic>> result = await database.query('games');

    for (var item in result) {
      basketGames.add(GameData(item['_id'], item['title'], item['image'],
          'description', item['price'], 100));
      total += int.parse(item['price']);
      print("total = $total");
    }

    return true;
  }

  //life cycle
  @override
  void initState() {
    super.initState();
    fetchedItems = getBasketItems();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total : $total TND",
              textScaleFactor: 1.5,
            )
          ],
        ),
        const Divider(color: Colors.red),
        Expanded(
          child: FutureBuilder(
            future: fetchedItems,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: basketGames.length,
                  itemBuilder: (context, index) {
                    return ElementInfo(
                        basketGames[index].image, basketGames[index].price);
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
