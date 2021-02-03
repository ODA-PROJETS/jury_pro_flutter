import 'package:demo/core/Services/EvenementService.dart';
import 'package:demo/core/domain/jury.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo/constants/Theme.dart';
import 'package:demo/constants/Variable.dart';

//widgets
import 'package:demo/widgets/navbar.dart';

import 'package:demo/widgets/card-small.dart';

import 'package:demo/widgets/drawerjury.dart';

class JEvenement extends StatefulWidget {
  @override
  _JEvenementState createState() => _JEvenementState();
}

class _JEvenementState extends State<JEvenement> {
  List evenement = [];
  Jury jury;
  List data;
  String codeJury = "0";
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
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    //print(evenement);
    if (arguments != null) {
      jury = Jury.fromJson(arguments['jury']);
      codeJury = jury.jury_code;
    }
    if (evenement.length == 0) {
      return Scaffold(
          appBar: Navbar(
            title: "HOME",
          ),
          backgroundColor: ArgonColors.bgColorScreen,
          // key: _scaffoldKey,
          drawer: JuryDrawer(currentPage: "juryHome"),
          body: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text("AUCUN EVENEMENT",
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
        //title: "JURY N° "+codeJury,
        title: "HOME",
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: JuryDrawer(currentPage: "juryHome"),
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
                      Navigator.pushNamed(context, '/detailV',
                          arguments: {'evenement': evenement[index]});
                    });
              },

              /// Set childCount to limit no.of items
              childCount: evenement.length + 5,
            ),
          )
        ]),
      ),
    );
  }
}
