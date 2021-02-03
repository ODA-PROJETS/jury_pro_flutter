import 'dart:io';

import 'package:demo/constants/Variable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroupeService {

  static List data=[];
  static Future<List> fetchGroupes() async {
    try{
      final response = await http.get(Variable.base_url + 'groupes');
      if (response.statusCode != 200) data = [];
      data = json.decode(response.body);
      return data;
    }on SocketException {
      return data;
    }

  }
}
