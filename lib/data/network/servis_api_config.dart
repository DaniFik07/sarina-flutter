import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:sarina/data/network/responses/get_sumber.dart';
import 'package:sarina/data/network/responses/reponse_pic.dart';
import 'package:sarina/data/network/responses/response_data_kegiatan.dart';
import 'package:sarina/data/network/responses/response_get_berita.dart';
import 'package:sarina/data/network/responses/response_get_galery.dart';
import 'package:sarina/data/network/responses/response_get_kegiatan.dart';
import 'package:sarina/data/network/responses/response_get_kuesioner.dart';
import 'package:sarina/data/network/responses/response_get_pengaduan.dart';
import 'package:sarina/data/network/responses/response_get_submit_bpbd.dart';
import 'package:sarina/data/network/responses/response_kabupaten.dart';
import 'package:sarina/data/network/responses/response_login.dart';
import 'package:sarina/data/network/responses/response_message.dart';
import 'package:sarina/data/network/responses/response_pic_by_id.dart';
import 'package:sarina/data/network/responses/response_province.dart';
import 'package:sarina/data/network/responses/response_register.dart';
import 'package:sarina/data/network/responses/response_slider.dart';
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

  Future<ResponseDetailProvinsi> getCovidDetailProv(String prov) async {
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

  Future<ResponseProvince> getProvince() async {
    Response response;
    response = await client.get("$base_url/provinsi");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ResponseProvince.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseKabupaten> getCity(String id) async {
    Response response;
    response = await client
        .post("$base_url/kabupatenbyid", body: {"provinces_id": id});
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseKabupaten.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseMessage> addGalery(String EVENT_ID,String photo,String token,) async {
    Response response;
    response = await client
        .post("$base_url/gallery/submit",
        body: {
          "EVENT_ID": EVENT_ID,
          "photo": photo,
        });
    if (response.statusCode == 200) {
      return ResponseMessage.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponsePic> getPic(String id, String token) async {
    Response response;
    response = await client.post("$base_url/pic",
        body: {"KABUPATEN_ID": id},
        headers: {"Authorization": "Bearer $token"});
    print("saadsad " + response.body);
    if (response.statusCode == 200) {
      return ResponsePic.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponsePicbyId> getPicById(String id, String token) async {
    Response response;
    response = await client.post("$base_url/picbyid",
        body: {"PIC_ID": id}, headers: {"Authorization": "Bearer $token"});
    print(response.body + " DATAAAAA");
    if (response.statusCode == 200) {
      return ResponsePicbyId.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetSlider> getSlider(String token) async {
    Response response;
    response = await client
        .get("$base_url/image", headers: {"Authorization": "Bearer $token"});
    print(response.body.toString() + "dsadsa");
    if (response.statusCode == 200) {
      return ResponseGetSlider.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetSumber> getSumber(String token) async {
    Response response;
    response = await client.get("$base_url/get_sumber",
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return ResponseGetSumber.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetKegiatan> getKegiatan(String token, String type) async {
    Response response;
    response = await client.get("$base_url/data_kegiatan/$type",
        headers: {"Authorization": "Bearer $token"});
    print(response.body.toString() + "dsadsa");
    if (response.statusCode == 200) {
      return ResponseGetKegiatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseMessage> submitNonAlam(
    String token,
    String ID_PROVINSI,
    String ID_KABUPATEN,
    String ID_USER,
    String ID_KEPLAK,
    String KERUGIAN_MATERI,
    String KETERANGAN,
    String TAHUN,
    String BENCANA,
    String CREATED_AT,
    String LAT,
    String LNG,
  ) async {
    Response response;
    response = await client.post("$base_url/data_bencana_non/submit", body: {
      "ID_PROVINSI": ID_PROVINSI,
      "ID_KABUPATEN": ID_KABUPATEN,
      "ID_USER": ID_USER,
      "ID_KEPLAK": ID_KEPLAK,
      "KERUGIAN_MATERI": KERUGIAN_MATERI,
      "KETERANGAN": KETERANGAN,
      "TAHUN": TAHUN,
      "BENCANA": BENCANA,
      "CREATED_AT": CREATED_AT,
      "LAT": LAT,
      "LNG": LNG,
    }, headers: {
      "Authorization": "Bearer $token"
    });
    print(response.body + " DATAAAAA");
    if (response.statusCode == 200) {
      return ResponseMessage.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseMessage> submitBPBDCapacity(
    String token,
    String ID_PROVINSI,
    String ID_KABUPATEN,
    String ID_USER,
    String ID_KEPLAK,
    String NAMA_PERANGKAT_DAERAH,
    String TIPE,
    String PNS,
    String NON_PNS,
    String SUKARELAWAN,
    String LAINNYA,
    String DASAR_PEMBENTUKAN,
    String KETERANGAN,
    String TAHUN,
    String CREATED_AT,
  ) async {
    Response response;
    response = await client.post("$base_url/kapasitas_bpbd/submit", body: {
      "ID_PROVINSI": ID_PROVINSI,
      "ID_KABUPATEN": ID_KABUPATEN,
      "ID_USER": ID_USER,
      "ID_KEPLAK": ID_KEPLAK,
      "NAMA_PERANGKAT_DAERAH": NAMA_PERANGKAT_DAERAH,
      "TIPE": TIPE,
      "PNS": PNS,
      "NON_PNS": NON_PNS,
      "SUKARELAWAN": SUKARELAWAN,
      "LAINNYA": LAINNYA,
      "DASAR_PEMBENTUKAN": DASAR_PEMBENTUKAN,
      "KETERANGAN": KETERANGAN,
      "TAHUN": TAHUN,
      "CREATED_AT": CREATED_AT
    }, headers: {
      "Authorization": "Bearer $token"
    });
    print(response.body + " DATAAAAA");
    if (response.statusCode == 200) {
      return ResponseMessage.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseMessage> submitBencana(
    String token,
    String ID_PROVINSI,
    String ID_KABUPATEN,
    String ID_USER,
    String ID_KEPLAK,
    String GEMPA_BUMI,
    String TSUNAMI,
    String GUNUNG_API,
    String ANGIN_TOPAN,
    String KEKERINGAN,
    String KARHUTLA,
    String LAINNYA,
    String KERUGIAN_MATERI,
    String KETERANGAN,
    String CREATED_AT,
    String TAHUN,
  ) async {
    Response response;
    response = await client.post("$base_url/data_bencana/submit", body: {
      "ID_PROVINSI": ID_PROVINSI,
      "ID_KABUPATEN": ID_KABUPATEN,
      "ID_USER": ID_USER,
      "ID_KEPLAK": ID_KEPLAK,
      "GEMPA_BUMI": GEMPA_BUMI,
      "TSUNAMI": TSUNAMI,
      "GUNUNG_API": GUNUNG_API,
      "ANGIN_TOPAN": ANGIN_TOPAN,
      "KEKERINGAN": KEKERINGAN,
      "KARHUTLA": KARHUTLA,
      "LAINNYA": LAINNYA,
      "KERUGIAN_MATERI": KERUGIAN_MATERI,
      "KETERANGAN": KETERANGAN,
      "TAHUN": TAHUN,
      "CREATED_AT": CREATED_AT,
    }, headers: {
      "Authorization": "Bearer $token"
    });
    print(response.body + " DATAAAAA");
    if (response.statusCode == 200) {
      return ResponseMessage.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseRegister> postRegister(
      String fullname,
      String username,
      String password,
      String email,
      String no_telp,
      String id_prov,
      String id_city) async {
    Response response;
    response = await client.post("$base_url/register", body: {
      "USERNAME": username,
      "PASSWORD": password,
      "EMAIL": email,
      "NO_TELPON": no_telp,
      "FULLNAME": fullname,
      "PROVINSI": id_prov,
      "KABUPATEN": id_city,
    });
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseRegister.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseLogin> postLogin(String email, String password) async {
    Response response;
    response = await client
        .post("$base_url/auth", body: {"PASSWORD": password, "EMAIL": email});
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseLogin.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseMessage> postKegiatan(
      String ID_USER,
      String ID_SUMBER,
      String JENIS_KEGIATAN,
      String NAMA_KEGIATAN,
      String PROGRESS,
      String TANGGAL,
      String WAKTU,
      String DESKRIPSI_KEGIATAN,
      String token) async {
    Response response;
    response = await client.post("$base_url/data_kegiatan/submit", body: {
      "ID_USER": ID_USER,
      "ID_SUMBER": ID_SUMBER,
      "JENIS_KEGIATAN": JENIS_KEGIATAN,
      "NAMA_KEGIATAN": NAMA_KEGIATAN,
      "PROGRESS": PROGRESS,
      "TANGGAL": TANGGAL,
      "WAKTU": WAKTU,
      "DESKRIPSI_KEGIATAN": DESKRIPSI_KEGIATAN,
    }, headers: {
      "Authorization": "Bearer $token"
    });
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseMessage.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetSubmitBpbd> getSubmitBPBD(
      String token, String id_kab) async {
    Response response;
    response = await client.post("$base_url/kapasitas_bpbd",
        body: {"ID_KABUPATEN": id_kab},
        headers: {"Authorization": "Bearer $token"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseGetSubmitBpbd.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseDataKegiatan> getAllKegiatan(
      String token) async {
    Response response;
    response = await client.get("$base_url/data_kegiatan",
        headers: {"Authorization": "Bearer $token"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseDataKegiatan.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetAllPengaduan> getAllPengaduan(
      String token) async {
    Response response;
    response = await client.get("$base_url/data_pengaduan",
        headers: {"Authorization": "Bearer $token"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseGetAllPengaduan.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetKuesioner> getKuesioner(
      String token) async {
    Response response;
    response = await client.get("$base_url/kuesioner",
        headers: {"Authorization": "Bearer $token"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseGetKuesioner.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetAllPengaduan> getPengaduan(
      String token,
      String id_city
      ) async {
    Response response;
    response = await client.get("$base_url/data_pengaduan/$id_city",
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseGetAllPengaduan.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetGallery> getGallery(
      String token,
      String id_kegiatan
      ) async {
    Response response;
    response = await client.get("$base_url/gallery/$id_kegiatan",
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      print('200 ok');
      return ResponseGetGallery.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<ResponseGetBerita> getBerita(
      String token,
      ) async {
    Response response;
    response = await client.get("$base_url/data_pengaduan/status",
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      print('${response.body}');
      return ResponseGetBerita.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }
}
