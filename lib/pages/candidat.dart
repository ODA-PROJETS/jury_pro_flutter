import 'package:demo/core/Services/CandidatService.dart';

import 'package:flutter/material.dart';

import 'package:demo/constants/Theme.dart';
import 'package:demo/constants/Variable.dart';

//widgets
import 'package:demo/widgets/navbar.dart';



import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/card-horizontal-p.dart';

class Candidat extends StatefulWidget {
  @override
  _CandidatState createState() => _CandidatState();
}

class _CandidatState extends State<Candidat> {
  List candidat = [];
  List evenement = [];
  List data;

  void getAllCandidat() async {
    data = await CandidatService.fetchCandidats();
    setState(() {
      candidat = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllCandidat();
  }

  @override
  Widget build(BuildContext context) {
    if (candidat.length == 0) {
      return Scaffold(
          appBar: Navbar(
            title: "CANDIDATS",
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          // key: _scaffoldKey,
          drawer: ArgonDrawer(currentPage: "Candidat"),
          body: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text("AUCUN CANDIDAT",
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
        title: "CANDIDATS",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "Candidat"),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(primary: false, slivers: <Widget>[
          SliverList(
            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                if (index > candidat.length - 1) return null;
                return CardHorizontal(
                    title:
                        "${candidat[index]["candidatNom"]} ${candidat[index]["candidatPrenoms"]}",
                    //img: candidat[index]["candidat_photo"],
                    tap: () {
                      Navigator.pushNamed(context, '/detailP',
                          arguments: {'candidat': candidat[index]});
                    });
              },

              /// Set childCount to limit no.of items
              childCount: candidat.length + 5,
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
              title: Text('INSCRIPTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), icon: null, labelText: "Nom"),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), icon: null, labelText: "Prenom"),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                border: OutlineInputBorder(), icon: null, labelText: "Email"),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                border: OutlineInputBorder(), icon: null, labelText: "Numero"),
          ),
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
