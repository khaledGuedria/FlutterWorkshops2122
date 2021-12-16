import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  //var
  late String? _username;
  late String? _password;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  //actions
  Future<void> insertSharedPrefs(String id) async {
    await SharedPreferences.getInstance().then((prefs){
      prefs.setString('username', _username!);
      prefs.setString('id', id);
    });
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "Le username ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le username doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                child: const Text("S'authentifier"),
                onPressed: () {
                  if(_keyForm.currentState!.validate()) {
                    _keyForm.currentState!.save();                    
                    //URL
                    String _baseUrl = "localhost:9090";
                    //Headers
                    Map<String, String> headers = {
                      "Content-Type":"application/json; charset=UTF-8"
                    };
                    //Body
                    Map<String, dynamic> userData = {
                      "username" : _username,
                      "password": _password
                    };
                    //Exec
                    http.post(Uri.http(_baseUrl, '/user/signin'), headers: headers, body: json.encode(userData)).then((http.Response response){

                      if (response.statusCode == 200) {
                        Map<String, dynamic> res = json.decode(response.body);
                        var userId = res['_id'];
                        insertSharedPrefs(userId).then((value) => Navigator.pushReplacementNamed(context, "/home/navTab"));
                        
                      } else if(response.statusCode == 401) {

                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Icon(Icons.info),
                                Text('Information'),
                              ],
                            ),
                            content: Text('Username ou Mot de passe incorrect!'),
                          );
                        },);

                      }else {

                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Icon(Icons.info),
                                Text('Information'),
                              ],
                            ),
                            content: Text('Oups! Veuiller réessayer plus tard.'),
                          );
                        },);
                        

                      }

                    });
                  
                  }
                },
              )
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: const Text("Créer un compte"),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/signup");
                  },
                )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Mot de passe oublié ?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      child: const Text("Cliquez ici", style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        Navigator.pushNamed(context, "/resetPwd");
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
