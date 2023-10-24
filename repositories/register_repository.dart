import '../models/root.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class IRegisterRepository {
  Future<List<Root>> fetchRegisterList();
  Future<Root> createNewRegister(Root root);
}


class RegisterRepository implements IRegisterRepository {

  final _host = "https://10.0.2.2:7022/api/Database/";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  @override
  Future<List<Root>> fetchRegisterList() async {
    var getUrl = _host + "GetAll";

    final response = await http.get(Uri.parse(getUrl));
    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['value'];

      // Convert the list of dynamic data to a list of Root objects
      List<Root> registers = data.map((item) => Root.fromJson(item)).toList();

      return registers;
    } else {
      throw Exception('Failed to load register data');
    }
  }

  @override
  Future<Root> createNewRegister(Root root) async {
    var url = _host + "CreateEdit";
    var _body = json.encode(root);

    var results = await http.post(Uri.parse(url),body: _body, headers: _headers, encoding: Encoding.getByName("utf-8"));

    final jsonObject = json.decode(results.body);

    var response = Root.fromJson(jsonObject);

    return response;
  }
}

// class RegisterRepository implements IRegisterRepository {
//   final String _universityApiUrl =
//       "http://universities.hipolabs.com/search?country=United+States";
//
//   @override
//   Future<List<Root>> fetchRegisterList() async {
//     final response = await http.get(Uri.parse(_universityApiUrl));
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = json.decode(response.body);
//       final List<Root> universities =
//       jsonList.map((json) => Root.fromJson(json)).toList();
//       return universities;
//     } else {
//       throw Exception('Failed to load university data');
//     }
//   }
// }