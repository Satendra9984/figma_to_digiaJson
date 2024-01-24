import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCallsHelper {
  static final Map<String, String> _header = {
    "X-Figma-Token": 'figd_kUGSoEKs3KwejKsYipZoPcd5XmcUuSny22-k1ciF'
  };
  static final String _nodeApiCall = 'https://api.figma.com/v1/files/';

  static Future<Map?> getFigmaUiNodes(
      {required String FILE_KEY, String? nodeIds}) async {
    Map? data = {};
    print('${_nodeApiCall}$FILE_KEY/nodes?ids=$nodeIds');
    await http
        .get(
      Uri.parse('${_nodeApiCall}$FILE_KEY/nodes?ids=$nodeIds'),
      headers: _header,
    )
        .then((response) async {
      if (response.statusCode != 200) {
        throw Exception('Network response was not ok');
      }
      data = await jsonDecode(response.body);
    }).catchError((error) {
      print('[Error]: $error');
      data = null;
    });
    return data;
  }
}
