import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:demo/constants/Theme.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/onboard-background2.jpg"),
                  fit: BoxFit.cover))),
      Padding(
        padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
        child: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset("assets/img/logo-argon.png", scale: 1),
                    Text(" JURY PRO",
                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0),
                      child: Text.rich(TextSpan(
                        text: "Organiser simplement",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                          "gerer les evenements ou noter des candidats / groupes.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: ArgonColors.text,
                      color: ArgonColors.secondary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("CONNEXION",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
