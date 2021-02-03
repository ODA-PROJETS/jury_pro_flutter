import 'dart:ui';
import 'package:demo/constants/Variable.dart';
import 'package:demo/core/Services/JuryService.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:demo/constants/Theme.dart';

import 'package:demo/widgets/drawer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkboxValue = false;
  String _error = "";
  final double height = window.physicalSize.height;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  List data;
  List jury = [];
  bool juryTrouver = false;
  int indexJury = 1;
  void getAllJury() async {
    data = await JuryService.fetchJury();
    setState(() {
      jury = data;
    });
  }

  @override
  void initState() {
    super.initState();
    this._emailController = TextEditingController();
    this._passwordController = TextEditingController();
    _reset();
    getAllJury();
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._emailController.text = '';
        this._passwordController.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: ArgonDrawer(currentPage: "Login"),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/register-bg.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 200, left: 24.0, right: 24.0, bottom: 32),
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height:
                                  MediaQuery.of(context).size.height / 2 * 0.15,
                              decoration: BoxDecoration(
                                  color: ArgonColors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5,
                                          color: ArgonColors.muted))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Connexion",
                                        style: TextStyle(
                                            color: ArgonColors.text,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold)),
                                  )),

                                  // Divider()
                                ],
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height /
                                  1.5 *
                                  0.63,
                              color: Color.fromRGBO(244, 245, 247, 1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Center(
                                          child: Text(
                                              "connectez vous en toute securité",
                                              style: TextStyle(
                                                  color: ArgonColors.text,
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            /*Padding(
                                              padding:
                                                  const EdgeInsets.all(38.0),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Name'),
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value.length < 2) {
                                                    return 'Name not long enough';
                                                  }
                                                },
                                              ),
                                            ),*/
                                            Center(
                                                child: Text(_error,
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller:
                                                    this._emailController,
                                                decoration:
                                                    const InputDecoration(
                                                  prefixIcon: Icon(
                                                      Icons.account_circle),
                                                  labelText: "Email",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                obscureText: true,
                                                  controller:
                                                      this._passwordController,
                                                  decoration:
                                                      const InputDecoration(
                                                        
                                                    prefixIcon:
                                                        Icon(Icons.lock),
                                                    labelText: "Mot de Passe",
                                                    border:
                                                        OutlineInputBorder(),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Center(
                                          child: FlatButton(
                                            textColor: ArgonColors.white,
                                            color: ArgonColors.primary,
                                            onPressed: () => verifLogin(
                                                _emailController.text,
                                                _passwordController.text),
                                            //if(_formKey.currentState.validate()) {
                                            /*Navigator.pushNamed(
                                                  context, '/home');*/

                                            //},
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 16.0,
                                                    top: 12,
                                                    bottom: 12),
                                                child: Text("VALIDER",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16.0))),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                ),
              ]),
            )
          ],
        ));
  }

  void verifLogin(String email, String password) {
    juryTrouver = false;
    /*for(var i=0; i<jury.length;i++){
      if(jury[i]["juryEmail"]==email && password=="123"){
        juryTrouver = true;
        indexJury = i;
        break;
      }
    }*/

    if (email == "admin" && password == "123") {
      Navigator.pushNamed(context, '/home');
    } else if (email == "jury" && password == "123") {
      print(jury);
      Variable.type_user = "jury";
      Navigator.pushNamed(
        context, '/juryHome',
        //arguments: {'jury': jury[indexJury]}
      );
    } else {
      setState(() {
        _error = "identifiant incorrect";
      });
    }
  }
}
