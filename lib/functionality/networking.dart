import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constant.dart';

class NetworkHelper {
  Future parseData() async {
    http.Response response = await http.get(kGetUrl);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<http.Response> createAlbum(String state, int flowRate) {
    return http.post(
      kSendUrl,
      headers: <String, String>{
        'X-M2M-Origin': '78ec648a50d8b16f:c6d4530fa3c93e7a',
        'Content-Type': 'application/json;ty=4',
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, dynamic>{
          "m2m:cin": {"con": "{\"state\":\"$state\",\"flowmq\":$flowRate}"}
        },
      ),
    );
  }
}
