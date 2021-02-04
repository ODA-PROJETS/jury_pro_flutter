import 'dart:ui';
import 'package:demo/constants/Variable.dart';
import 'package:demo/widgets/drawerJury.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants/Theme.dart';

//widgets
import 'package:demo/widgets/navbar.dart';
import 'package:demo/widgets/drawer.dart';

class Profile extends StatelessWidget {
  void _change(String ip) {
    setState() {
      Variable.base_url = ip;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(Variable.base_url);
    TextEditingController _ipController;
    _ipController = TextEditingController();
    _ipController.text = Variable.base_url;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Profile",
          transparent: true,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: Variable.type_user == "jury"
            ? JuryDrawer(currentPage: "Profile")
            : ArgonDrawer(currentPage: "Profile"),
        body: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/img/profile-screen-bg.jpg"),
                      fit: BoxFit.fitWidth))),
          SafeArea(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: .0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 85.0, bottom: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        /*Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ArgonColors.info,
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "CONNECT",
                                                style: TextStyle(
                                                    color: ArgonColors.white,
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 8.0),
                                            ),
                                            SizedBox(
                                              width: 30.0,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ArgonColors.initial,
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "MESSAGE",
                                                style: TextStyle(
                                                    color: ArgonColors.white,
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 8.0),
                                            )
                                          ],
                                        ),*/
                                        SizedBox(height: 40.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text("10",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            82, 95, 127, 1),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text("evenement(s) type groupe",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 12.0))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("0",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            82, 95, 127, 1),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    "evenement(s) type candidat",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 12.0))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 40.0),
                                        Align(
                                          child: Text(Variable.username,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 28.0)),
                                        ),
                                        SizedBox(height: 10.0),
                                        Align(
                                          child: Text(Variable.mail,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w200)),
                                        ),
                                        Divider(
                                          height: 40.0,
                                          thickness: 1.5,
                                          indent: 32.0,
                                          endIndent: 32.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 32.0, right: 32.0),
                                          child: Align(
                                            child: TextField(
                                              controller: _ipController,
                                              decoration: const InputDecoration(
                                                // labelStyle: TextStyle(fontSize: 25),
                                                labelText: "ip distant:",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 32.0, right: 32.0),
                                          child: RaisedButton(
                                            color: Colors.deepOrange,
                                            child: Text("changer"),
                                            onPressed: () =>
                                                _change(_ipController.text),
                                          ),
                                        ),
                                        SizedBox(height: 55.0),
                                        Container(
                                          child: RaisedButton.icon(
                                              padding: EdgeInsets.all(10),
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                      context, '/login'),
                                              icon: Icon(
                                                Icons.logout,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                "deconnexion",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      FractionalTranslation(
                          translation: Offset(0.0, -0.5),
                          child: Align(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/img/profile-screen-avatar.jpg"),
                              radius: 65.0,
                              // maxRadius: 200.0,
                            ),
                            alignment: FractionalOffset(0.5, 0.0),
                          ))
                    ]),
                  ],
                ),
              ),
            ]),
          )
        ]));
  }
}
