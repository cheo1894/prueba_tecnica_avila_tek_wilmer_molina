import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserSources {
  String apiKey = '6c251f20';

  String urlBase = 'https://my.api.mockaroo.com/';

  Future getCurrentUser() async {
    String endpoint = '${urlBase}current-user.json?key=$apiKey';

    try {
      var res = await http.get(Uri.parse((endpoint)));

      if (res.statusCode == 200) {
        var decodedRes = jsonDecode(res.body);
        return decodedRes;
      } else {
        return {};
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getJobs() async {
    String endpoint = '${urlBase}job-titles.json?key=$apiKey';

    try {
      var res = await http.get(Uri.parse((endpoint)));
      if (res.statusCode == 200) {
        var decodedRes = jsonDecode(res.body);
        return decodedRes;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
