import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //var
  String _baseUrl = 'localhost:9090';
  late Future<bool> fetchedGames;
  final List<GameData> _games = [];


  //Actions
  Future<bool> getGames() async {
    http.Response response = await http.get(Uri.http(_baseUrl, "/game"));
    List<dynamic> gamesFromServer = json.decode(response.body);
    for (var item in gamesFromServer) {
      _games.add(GameData(item['_id'], item['title'], item['image'],
          item['description'], item['price'], item['quantity']));
    }


    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchedGames = getGames();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchedGames,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: _games.length,
            itemBuilder: (context, index) {
            return ProductInfo(
            _games[index].id,
            _games[index].image,
            _games[index].title,
            _games[index].description,
            _games[index].price,
            _games[index].quantity);
          },);
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
    },);
  }
}

/* ListView.builder(
      itemCount: _games.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductInfo(
            _games[index].image,
            _games[index].title,
            _games[index].description,
            _games[index].price,
            _games[index].quantity);
      },
    ); */
class GameData {
  final String id;
  final String title;
  final String image;
  final String description;
  final int price;
  final int quantity;

  GameData(this.id, this.title, this.image, this.description, this.price, this.quantity);

  @override
  String toString() {
    return 'GameData{title: $title, image: $image, description: $description, price: $price, quantity: $quantity}';
  }
}
