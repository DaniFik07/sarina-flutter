import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:sarina/data/network/responses/response_register.dart';
import 'package:sarina/utils/constants.dart';

import 'responses/response_covid_provinsi.dart';
import 'responses/response_detail_prov.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ServiceApiConfig {
  Client client = Client();
  String base_url_covid = BASE_URL_COVID;
  String base_url = BASE_URL;
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

  Future<ResponseDetailProvinsi> getCovidDetailProv(
      String prov
      ) async {
    Response response;
    response = await client.get("$base_url_covid/prov_detail_$prov.json");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseDetailProvinsi.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }
  Future<ResponseRegister> postRegister(
      String username,
      String password,
      String email,
      String no_telp
      ) async {
    Response response;
    response = await client.post("$base_url/register"
    ,body: {
      "USERNAME":username,
      "PASSWORD":password,
      "EMAIL":email,
      "NO_TELPON":no_telp,

        }
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseRegister.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

}
