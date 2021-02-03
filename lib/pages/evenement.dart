import 'package:demo/core/Services/EvenementService.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo/constants/Theme.dart';
import 'package:demo/constants/Variable.dart';

//widgets
import 'package:demo/widgets/navbar.dart';

import 'package:demo/widgets/card-small.dart';

import 'package:demo/widgets/drawer.dart';

  class Evenement extends StatefulWidget {
  @override
  _EvenementState createState() => _EvenementState();
}

class _EvenementState extends State<Evenement> {
  List evenement = [];
  List data;
  TextEditingController _typeController;
  TextEditingController _nomController;
  TextEditingController _dateDebutController;
  TextEditingController _dateFinController;
  String _image;
  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;
  void getAllEvent() async {
    data = await EvenementService.fetchEvenements();
    setState(() {
      evenement = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllEvent();
    this._typeController = TextEditingController();
    this._nomController = TextEditingController();
    this._dateDebutController = TextEditingController();
    this._dateFinController = TextEditingController();
    _reset();
  }

  @override
  Widget build(BuildContext context) {
    if (evenement.length == 0) {
      return Scaffold(
          appBar: Navbar(
            title: "EVENEMENTS",
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          // key: _scaffoldKey,
          drawer: ArgonDrawer(currentPage: "Evenement"),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [ 
                  Text("AUCUN EVENEMENT",
                style: TextStyle(fontWeight:FontWeight.bold,)),
                SizedBox(height: 10.0,),
                Text("raison possible :"),
                SizedBox(height: 10.0,),

                Text("- Api distant fermé"),
                Text("- l'Api a retourné une erreur"),
                Text("- Aucune connexion a internet"),
                Text("- Aucune evenement enregistré"),

                
                ]
              )
              )
          ));
    }

    return Scaffold(
      appBar: Navbar(
        title: "EVENEMENTS",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: ArgonDrawer(currentPage: "Evenement"),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(primary: false, slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              ///no.of items in the horizontal axis
              crossAxisCount: 2,
            ),

            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                if (index > evenement.length - 1) return null;
                return CardSmall(
                    title: "${evenement[index]["evenement_nom"]}",
                    tap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: {'evenement': evenement[index]});
                    });
              },

              /// Set childCount to limit no.of items
              childCount: evenement.length + 5,
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>showModalBottomSheet(context: context, builder: (ctx)=> _buildBottomSheet(ctx)),
        tooltip: 'Ajout',
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );

  }
  Container _buildBottomSheet(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const Text("ENREGISTREZ UN EVENEMENT",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            const Divider(),
            TextField(
              controller: this._nomController,
              decoration: const InputDecoration(
                labelText: "Nom de l'evenement:",
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(),
            TextField(
              controller: this._typeController,
              decoration: const InputDecoration(
                labelText: "Type d'evenement:",
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(),
            TextField(
              controller: this._dateDebutController,
              decoration: const InputDecoration(
                labelText: "Date de debut:",
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(),
            TextField(
              controller: this._dateFinController,
              decoration: const InputDecoration(
                labelText: "Date de fin:",
                border: OutlineInputBorder(),
              ),
            ),
        new Container(
          margin: const EdgeInsets.all(50.0),
          child : RaisedButton(
                  color: Colors.deepOrange,
                  elevation: 0,
                  onPressed: _pending
                      ? null
                      : () => this._httpPost(
                    _typeController.text,
                    _nomController.text,
                    _dateDebutController.text,
                    _dateFinController.text,
                  ),
                  child: Center(child: Text('ENREGISTRER',style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),)
                ),
        ),

          ],
        )
    );
  }


  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._typeController.text = '';
        this._nomController.text ='';
        this._dateDebutController.text = '2021-01-01';
        this._dateFinController.text = '2021-12-31';
      }
      this._responseBody = '<empty>';
      this._error = '<none>';
      this._pending = false;
    });
  }
  Future<void> _httpPost(String type, String nom, String dateDebut, String dateFin) async {
    _reset(resetControllers: false);
    setState(() => this._pending = true);
    try {
      final http.Response response = await http.post(
        Variable.base_url + 'evenements/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'type': type,
          'nom': nom,
          'date_debut': dateDebut,
          'date_fin': dateFin,
        }),
      );
      // If the server did return a 201 CREATED response.
      if (response.statusCode == 201) {
        setState(() => this._responseBody = response.body);
      } else {
        setState(() => this._error = 'Failed to add a post: $response');
      }
    } catch (e) {
      setState(() => this._error = 'Failed to add a post: $e');
    }
    setState(() => this._pending = false);
  }
}
