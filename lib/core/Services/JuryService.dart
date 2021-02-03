import 'dart:io';

import 'package:demo/constants/Variable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JuryService {
  static List data=[];
  static Future<List> fetchJury() async {
    try{
      final response = await http.get(Variable.base_url + 'juries');
      if (response.statusCode != 200) data = [];
      else data = json.decode(response.body);
      return data;
    }on SocketException {
      return data;
    }
  }
}
