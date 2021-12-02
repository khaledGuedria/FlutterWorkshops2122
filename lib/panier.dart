import 'package:flutter/material.dart';

class Panier extends StatefulWidget {
  const Panier({ Key? key }) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Total : 500 TND', style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Column(
              children: [
                CartItem("assets/images/dmc5.jpg", 200),
                CartItem("assets/images/minecraft.jpg", 200),
                CartItem("assets/images/fifa.jpg", 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class CartItem extends StatelessWidget {

  final int price;
  final String image;

  const CartItem(this.image, this.price);

  //const CartItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.restore_from_trash_rounded, size: 50,),
              Image.asset(image, height: 50,),
              Text(price.toString() + ' TND', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}