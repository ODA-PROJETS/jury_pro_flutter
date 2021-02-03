import 'package:demo/core/Services/CandidatService.dart';
import 'package:demo/core/Services/GroupeService.dart';

import 'package:demo/core/Services/EvenementService.dart';
import 'package:flutter/material.dart';

import 'package:demo/constants/Theme.dart';
import 'package:demo/constants/Variable.dart';

//widgets
import 'package:demo/widgets/navbar.dart';

import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/card-horizontal-p.dart';

class Groupe extends StatefulWidget {
  @override
  _GroupeState createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  List groupe = [];
  List _evenement = [];
  List data;

  void getAllGroupe() async {
    data = await GroupeService.fetchGroupes();
    setState(() {
      groupe = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllGroupe();
    getAllEvent();
  }

  void getAllEvent() async {
    data = await EvenementService.fetchEvenements();
    setState(() {
      _evenement = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (groupe.length == 0) {
      return Scaffold(
          appBar: Navbar(
            title: "GROUPES",
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          // key: _scaffoldKey,
          drawer: ArgonDrawer(currentPage: "Groupe"),
          body: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text("AUCUN GROUPE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("raison possible :"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("- Api distant fermé"),
                    Text("- l'Api a retourné une erreur"),
                    Text("- Aucune connexion a internet"),
                    Text("- Aucune evenement enregistré"),
                  ]))));
    }

    return Scaffold(
      appBar: Navbar(
        title: "GROUPES",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "Groupe"),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(primary: false, slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index > groupe.length - 1) return null;
                print(groupe[index]);
                return CardHorizontal(
                    title: "${groupe[index]["groupe_nom"]}",
                    img: groupe[index]["groupe_photo"],
                    tap: () {
                      Navigator.pushNamed(context, '/detailG',
                          arguments: {'groupe': groupe[index]});
                    });
              },

              /// Set childCount to limit no.of items
              childCount: groupe.length + 5,
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context, builder: (ctx) => _buildBottomSheet(ctx)),
        tooltip: 'Ajout',
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const ListTile(
              title: Text('AJOUTER UN GROUPE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: null,
                labelText: "Nom du groupe"),
          ),
          SizedBox(height: 10),
          SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
              onPressed: null,
              icon: Icon(Icons.save),
              label: Text("valider"),
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
