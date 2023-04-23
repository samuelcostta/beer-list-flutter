// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  ListBeerState createState() => ListBeerState();
}

class ListBeerState extends State<ListPage> {
  var pathArquivo = './bebidas.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      //Recurso para consumir um dado de forma assincrona.
      //Teste recurso pode ser local ou remoto
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString(pathArquivo),
          builder: (context, snapshot) {
            //Leu o arquivo e está atribuindo todos os dados para a variável bebidas;
            var bebidas = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var bebida = bebidas[index];
                return Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                      Text(bebida["name"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23)),
                      Text(bebida["country"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(bebida["abv"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Image.network(bebida["image"], height: 200)
                    ]));
              },
              itemCount: bebidas == null ? 0 : bebidas.length,
            );
          }),
    ));
  }
}
