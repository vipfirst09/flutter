import 'dart:convert';

import 'package:flutter_application_1/config/api_config.dart';
import 'package:flutter_application_1/models/currentprice.dart';
import 'package:http/http.dart';

class ServiceApi {
  Future<Currentprice> getCurrentPrice({String? search}) async {
    final response = await get(
      Uri.https(server, '/v1/bpi/currentprice.json', {'search': search}),
    );
    return Currentprice.fromJson(jsonDecode(response.body));
  }
}
