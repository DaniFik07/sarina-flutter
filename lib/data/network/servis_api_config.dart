import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:sarina/utils/constants.dart';

import 'responses/response_covid_provinsi.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ServiceApiConfig {
  Client client = Client();
  String base_url_covid = BASE_URL_COVID;
  // String base_url = BASE_URL;


  Future<ResponseCovidProvinsi> getCovidProv() async {
    Response response;
    response = await client.get("$base_url_covid/prov.json");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseCovidProvinsi.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

}
