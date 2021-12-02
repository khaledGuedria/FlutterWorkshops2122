import 'package:flutter/material.dart';

class TabbarCustomDrawer extends StatefulWidget {
  const TabbarCustomDrawer({ Key? key }) : super(key: key);

  @override
  _TabbarCustomDrawerState createState() => _TabbarCustomDrawerState();
}

class _TabbarCustomDrawerState extends State<TabbarCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
          appBar: AppBar(
            title: Text('G-Store Esprit', style: TextStyle(fontSize: 18),),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //1: Modifier profil
                ListTile(
                  onTap: (){
                    print('object');
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.edit, size: 25,),
                      SizedBox(width: 15,),
                      Text('Modifier profile')
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, '/bottom');
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.tab, size: 25,),
                      SizedBox(width: 15,),
                      Text('Navigation du bas')
                    ],
                  ),
                )
                //2 : Navigation
              ],
            ),
          ),
        ),
    );
  }
}