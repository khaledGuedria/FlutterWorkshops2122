import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductDetails extends StatefulWidget {
  final String _id;
  final String _image;
  final String _title;
  final String _description;
  final int _price;
  final int _quantity;

  const ProductDetails(
      this._id, this._image, this._title, this._description, this._price, this._quantity);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //var
  late int _currentQuantity;

  //actions
  Future<void> insertSQF() async{
    Database database = await openDatabase(
      join(await getDatabasesPath(), 'gstore_esprit_database.db'),
      onCreate: (db, version) {
        db.transaction((txn) async {
          await txn.execute('CREATE TABLE games (_id TEXT PRIMARY KEY, title TEXT, image TEXT, price INTEGER)');
        });
      },
      version: 1,
    );

    Map<String, dynamic> gameObject = {

      "_id" : widget._id,
      "title" : widget._title,
      "image" : widget._image,
      "price" : widget._price

    };

    database.insert('games', gameObject, conflictAlgorithm: ConflictAlgorithm.replace);

    //confirm
    List<Map<String, dynamic>> res = await database.query('games');
    print(res);

  }

  //life cycle
  @override
  void initState() {
    _currentQuantity = widget._quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.network("http://localhost:9090/img/" + widget._image,
                  width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._description),
          ),
          Text(widget._price.toString() + " TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : " + _currentQuantity.toString()),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: false,
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_basket_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Acheter", textScaleFactor: 2)
                  ],
                ),
                onPressed: () {
                  setState(() {
                    _currentQuantity--;
                    print(_currentQuantity);
                  });
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            insertSQF();
          },
          icon: Icon(Icons.shopping_basket),
          label: Text('Acheter')),
    );
  }
}
