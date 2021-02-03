import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:demo/constants/Theme.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Titre",
        this.img = "15",
        this.tap = defaultFunc});


  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    String uri = 'data:image/gif;base64,'+img;
    Uint8List _bytes = base64.decode(uri.split(',').last);
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
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.only(left : 50.0,  right : 50.0 ),
                      child: Image.memory(_bytes),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            bottomLeft: Radius.circular(6.0)),

                      )),
                ),
                Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top:30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                  color: ArgonColors.header, fontSize: 20)),

                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
