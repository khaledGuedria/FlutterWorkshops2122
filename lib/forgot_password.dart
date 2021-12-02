import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reinitialiser Mot de passe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/minecraft.jpg'),
            SizedBox(
            height: 50,
            ),
            Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Nouveau Mot de passe"),
            ),
          ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){

            }, child: Text('Reinitialiser mot de passe'))
          ],
        ),
      ),
    );
  }
}