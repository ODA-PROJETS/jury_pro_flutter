import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:demo/constants/Theme.dart';

class CardHorizontal2 extends StatelessWidget {
  CardHorizontal2(
      {this.texte = "Placeholder Title",
      this.nbre = "15",
      this.tap = defaultFunc});


  final String nbre;
  final Function tap;
  final String texte;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 0.6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Padding(
                      
                       padding: const EdgeInsets.only(left : 40.0, top: 25 ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(texte,
                              style: TextStyle(
                                  color: ArgonColors.header, fontSize: 20)),
                          
                        ],
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Container(
                   padding: const EdgeInsets.only(left: 70),
                    child: Text("${nbre??0}",
                    style: TextStyle(
                        color: Colors.deepOrange,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),),
                      decoration: BoxDecoration( 
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              bottomLeft: Radius.circular(6.0)),
                         
                          )),
                ),
                
              ],
            ),
          ),
        ));
  }
}
