import 'package:demo/pages/detailEvent.dart';
import 'package:demo/pages/detailP.dart';
import 'package:demo/pages/detailG.dart';
import 'package:demo/pages/groupe.dart';
import 'package:demo/pages/jury.dart';
import 'package:demo/pages/jury/detailEvent.dart';
import 'package:demo/pages/jury/evenement.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/profile.dart';
import 'package:flutter/material.dart';

// screens
import 'package:demo/pages/onboarding.dart';

import 'pages/board.dart';
import 'pages/evenement.dart';
import 'pages/candidat.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jury Pro',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/onboarding",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
          "/evenement" : (BuildContext context)=> new Evenement(),
          "/detail" : (BuildContext context)=> new DetailPage(),
          "/detailV" :(BuildContext context)=> new DetailVote(),
          "/detailP" : (BuildContext context)=> new DetailP(),
          "/detailG" : (BuildContext context)=> new DetailG(),
          "/candidat": (BuildContext context) => new Candidat(),
          "/groupe": (BuildContext context) => new Groupe(),
          "/juryHome": (BuildContext context) => new JEvenement(),
          "/profile": (BuildContext context) => new Profile(),
          "/jury": (BuildContext context) => new Jury(),
          "/login": (BuildContext context) => new Login(),
        });
  }
}
