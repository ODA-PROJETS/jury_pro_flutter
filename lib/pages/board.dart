import 'dart:io';

import 'package:flutter/material.dart';

import 'package:demo/constants/Theme.dart';
import 'package:demo/constants/Variable.dart';

//widgets
import 'package:demo/widgets/navbar.dart';
import 'package:demo/widgets/card-horizontal.dart';
import 'package:demo/widgets/card-horizontal2.dart';

import 'package:demo/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  List evenement = [];
  List candidat = [];
  List groupe = [];
  List jury = [];
  List data = [];

  Future evenements() async {
    try {
      final response = await http.get(Variable.base_url + 'evenements');
      data = json.decode(response.body);

      if (response.statusCode != 200) data = [];
    } on SocketException {
      print('No connection');
    }
    setState(() {
      evenement = data;
    });
  }

  Future candidats() async {
    try {
      final response = await http.get(Variable.base_url + 'candidats');
      if (response.statusCode != 200)
        data = [];
      else
        data = json.decode(response.body);
    } on SocketException {
      print('No connection');
    }
    setState(() {
      candidat = data;
    });
  }

  Future groupes() async {
    try {
      final response = await http.get(Variable.base_url + 'groupes');
      if (response.statusCode != 200)
        data = [];
      else
        data = json.decode(response.body);
    } on SocketException {
      print('No connection');
    }
    setState(() {
      groupe = data;
    });
  }

  Future jurys() async {
    try {
      final response = await http.get(Variable.base_url + 'jury');
      if (response.statusCode != 200)
        data = [];
      else
        data = json.decode(response.body);
    } on SocketException {
      print('No connection');
    }
    setState(() {
      jury = data;
    });
  }

  @override
  void initState() {
    super.initState();
    evenements();
    candidats();
    groupes();
    jurys();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: Navbar(
          title: "DASHBOARD",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal(
                    texte: "Evenement Enregistré(s)",
                    nbre: "${evenement.length ?? 0}",
                    tap: () {
          Navigator.pushNamed(context, '/evenement');
          }
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal2(
                    texte: "Candidat Enregistré(s)",
                    nbre: "${candidat.length}",
                    tap: () {
                Navigator.pushNamed(context, '/candidat');
                }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal2(
                    texte: "Groupe Enregistré(s)",
                    nbre: "${groupe.length}",
                    // tap: () {
                    //   Navigator.pushNamed(context, '/pro');
                    // }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal(
                    texte: "Jury Enregistré(s)",
                    nbre: "${jury.length}",
                    // tap: () {
                    //   Navigator.pushNamed(context, '/pro');
                    // }
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
