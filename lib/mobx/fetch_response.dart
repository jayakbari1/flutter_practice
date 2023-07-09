import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchResponse {
  Future<List> fetchData() async {
    List<dynamic> response;

    final result = await http.get(Uri.parse(
        'https://www.reddit.com/r/Cricket/comments/12hhdpr/match_thread_15th_match_royal_challengers.json'));

    if (result.statusCode == 200) {
      response = jsonDecode(result.body);
      print(response);
    } else {
      throw 'Enable to retrieve data';
    }

    return response;
  }
}
