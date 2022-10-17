import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffFF66C4)),
        backgroundColor: Colors.white,
        title: Image.asset("imagens/logo.png", width: 90, height: 50),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res!;
              });
              print("resultado: digitado " + res!);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xffFF66C4),
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Color(0xffFF51D9),
        items: const [
          BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Em alta", icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: "Inscrições", icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: "Biblioteca", icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
