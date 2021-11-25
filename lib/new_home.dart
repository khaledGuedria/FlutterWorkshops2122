import 'package:flutter/material.dart';
import 'package:workshop_sim4/home.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {

    //var
  final List<Game> games = const [
  const Game("assets/images/dmc5.jpg", "Devil May Cry 5", 200),
  const Game("assets/images/re8.jpg", "Resident Evil VIII", 200),
  const Game("assets/images/nfs.jpg", "Need For Speed Heat", 100),
  const Game("assets/images/rdr2.jpg", "Red Dead Redemption II", 150),
  const Game("assets/images/fifa.jpg", "FIFA 22", 100)
  ];

  //actions

  //lifecycle
  @override
  void initState() {
    super.initState();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('G-Store Esprit'),),
      body: GridView.builder(
        itemCount: games.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisSpacing: 5,
        mainAxisExtent: 155,
        crossAxisSpacing: 5), 
        itemBuilder: (context, index){
          return GridViewItem(games[index].image, games[index].title);
        })
    );
  }
}

//=============================================================================
//=============================================================================
//=============================================================================

//CustomCell
class GridViewItem extends StatelessWidget {

  //var
  final String _image;
  final String _name;

  //constructor
  const GridViewItem(this._image, this._name);

  //build
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 215,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(_image),
              SizedBox(height: 15,),
              Center(child: Text(_name, style: TextStyle(fontSize: 16),),)
            ],
          ),
        ),
      ),
    );
  }
}



