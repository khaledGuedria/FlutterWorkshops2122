import 'package:flutter/material.dart';

import 'product_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-Store ESPRIT"),
      ),
      body: Column(
        children: const [
          ProductInfo("assets/images/dmc5.jpg", "Devil May Cry 5", 200),
          ProductInfo("assets/images/re8.jpg", "Resident Evil VIII", 200),
          ProductInfo("assets/images/nfs.jpg", "Need For Speed Heat", 100),
          ProductInfo("assets/images/rdr2.jpg", "Red Dead Redemption II", 150),
          ProductInfo("assets/images/fifa.jpg", "FIFA 22", 100)
        ],
      ),
    );
  }
}