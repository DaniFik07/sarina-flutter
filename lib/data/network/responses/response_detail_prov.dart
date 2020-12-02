/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
// To parse this JSON data, do
//
//     final responseDetailProvinsi = responseDetailProvinsiFromJson(jsonString);

import 'dart:convert';

ResponseDetailProvinsi responseDetailProvinsiFromJson(String str) => ResponseDetailProvinsi.fromJson(json.decode(str));

String responseDetailProvinsiToJson(ResponseDetailProvinsi data) => json.encode(data.toJson());

class ResponseDetailProvinsi {
  ResponseDetailProvinsi({
    this.lastDate,
    this.provinsi,
    this.kasusTotal,
    this.kasusTanpaTgl,
    this.kasusDenganTgl,
    this.meninggalPersen,
    this.meninggalTanpaTgl,
    this.meninggalDenganTgl,
    this.sembuhPersen,
    this.sembuhTanpaTgl,
    this.sembuhDenganTgl,
    this.listPerkembangan,
    this.data,
  });

  DateTime lastDate;
  String provinsi;
  int kasusTotal;
  int kasusTanpaTgl;
  int kasusDenganTgl;
  double meninggalPersen;
  int meninggalTanpaTgl;
  int meninggalDenganTgl;
  double sembuhPersen;
  int sembuhTanpaTgl;
  int sembuhDenganTgl;
  List<ListPerkembangan> listPerkembangan;
  Data data;

  factory ResponseDetailProvinsi.fromJson(Map<String, dynamic> json) => ResponseDetailProvinsi(
    lastDate: json["last_date"] == null ? null : DateTime.parse(json["last_date"]),
    provinsi: json["provinsi"] == null ? null : json["provinsi"],
    kasusTotal: json["kasus_total"] == null ? null : json["kasus_total"],
    kasusTanpaTgl: json["kasus_tanpa_tgl"] == null ? null : json["kasus_tanpa_tgl"],
    kasusDenganTgl: json["kasus_dengan_tgl"] == null ? null : json["kasus_dengan_tgl"],
    meninggalPersen: json["meninggal_persen"] == null ? null : json["meninggal_persen"].toDouble(),
    meninggalTanpaTgl: json["meninggal_tanpa_tgl"] == null ? null : json["meninggal_tanpa_tgl"],
    meninggalDenganTgl: json["meninggal_dengan_tgl"] == null ? null : json["meninggal_dengan_tgl"],
    sembuhPersen: json["sembuh_persen"] == null ? null : json["sembuh_persen"].toDouble(),
    sembuhTanpaTgl: json["sembuh_tanpa_tgl"] == null ? null : json["sembuh_tanpa_tgl"],
    sembuhDenganTgl: json["sembuh_dengan_tgl"] == null ? null : json["sembuh_dengan_tgl"],
    listPerkembangan: json["list_perkembangan"] == null ? null : List<ListPerkembangan>.from(json["list_perkembangan"].map((x) => ListPerkembangan.fromJson(x))),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "last_date": lastDate == null ? null : "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
    "provinsi": provinsi == null ? null : provinsi,
    "kasus_total": kasusTotal == null ? null : kasusTotal,
    "kasus_tanpa_tgl": kasusTanpaTgl == null ? null : kasusTanpaTgl,
    "kasus_dengan_tgl": kasusDenganTgl == null ? null : kasusDenganTgl,
    "meninggal_persen": meninggalPersen == null ? null : meninggalPersen,
    "meninggal_tanpa_tgl": meninggalTanpaTgl == null ? null : meninggalTanpaTgl,
    "meninggal_dengan_tgl": meninggalDenganTgl == null ? null : meninggalDenganTgl,
    "sembuh_persen": sembuhPersen == null ? null : sembuhPersen,
    "sembuh_tanpa_tgl": sembuhTanpaTgl == null ? null : sembuhTanpaTgl,
    "sembuh_dengan_tgl": sembuhDenganTgl == null ? null : sembuhDenganTgl,
    "list_perkembangan": listPerkembangan == null ? null : List<dynamic>.from(listPerkembangan.map((x) => x.toJson())),
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.lastUpdate,
    this.kasus,
    this.sembuh,
    this.meninggal,
    this.perawatan,
  });

  DateTime lastUpdate;
  Kasus kasus;
  Meninggal sembuh;
  Meninggal meninggal;
  Meninggal perawatan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    lastUpdate: json["last_update"] == null ? null : DateTime.parse(json["last_update"]),
    kasus: json["kasus"] == null ? null : Kasus.fromJson(json["kasus"]),
    sembuh: json["sembuh"] == null ? null : Meninggal.fromJson(json["sembuh"]),
    meninggal: json["meninggal"] == null ? null : Meninggal.fromJson(json["meninggal"]),
    perawatan: json["perawatan"] == null ? null : Meninggal.fromJson(json["perawatan"]),
  );

  Map<String, dynamic> toJson() => {
    "last_update": lastUpdate == null ? null : "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
    "kasus": kasus == null ? null : kasus.toJson(),
    "sembuh": sembuh == null ? null : sembuh.toJson(),
    "meninggal": meninggal == null ? null : meninggal.toJson(),
    "perawatan": perawatan == null ? null : perawatan.toJson(),
  };
}

class Kasus {
  Kasus({
    this.kondisiPenyerta,
    this.jenisKelamin,
    this.kelompokUmur,
    this.gejala,
  });

  KasusGejala kondisiPenyerta;
  KasusGejala jenisKelamin;
  KasusKelompokUmur kelompokUmur;
  KasusGejala gejala;

  factory Kasus.fromJson(Map<String, dynamic> json) => Kasus(
    kondisiPenyerta: json["kondisi_penyerta"] == null ? null : KasusGejala.fromJson(json["kondisi_penyerta"]),
    jenisKelamin: json["jenis_kelamin"] == null ? null : KasusGejala.fromJson(json["jenis_kelamin"]),
    kelompokUmur: json["kelompok_umur"] == null ? null : KasusKelompokUmur.fromJson(json["kelompok_umur"]),
    gejala: json["gejala"] == null ? null : KasusGejala.fromJson(json["gejala"]),
  );

  Map<String, dynamic> toJson() => {
    "kondisi_penyerta": kondisiPenyerta == null ? null : kondisiPenyerta.toJson(),
    "jenis_kelamin": jenisKelamin == null ? null : jenisKelamin.toJson(),
    "kelompok_umur": kelompokUmur == null ? null : kelompokUmur.toJson(),
    "gejala": gejala == null ? null : gejala.toJson(),
  };
}

class KasusGejala {
  KasusGejala({
    this.currentData,
    this.missingData,
    this.listData,
  });

  int currentData;
  double missingData;
  List<GejalaListDatum> listData;

  factory KasusGejala.fromJson(Map<String, dynamic> json) => KasusGejala(
    currentData: json["current_data"] == null ? null : json["current_data"],
    missingData: json["missing_data"] == null ? null : json["missing_data"].toDouble(),
    listData: json["list_data"] == null ? null : List<GejalaListDatum>.from(json["list_data"].map((x) => GejalaListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "current_data": currentData == null ? null : currentData,
    "missing_data": missingData == null ? null : missingData,
    "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class GejalaListDatum {
  GejalaListDatum({
    this.key,
    this.docCount,
  });

  String key;
  double docCount;

  factory GejalaListDatum.fromJson(Map<String, dynamic> json) => GejalaListDatum(
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
  };
}

class KasusKelompokUmur {
  KasusKelompokUmur({
    this.currentData,
    this.missingData,
    this.listData,
  });

  int currentData;
  double missingData;
  List<KelompokUmurListDatum> listData;

  factory KasusKelompokUmur.fromJson(Map<String, dynamic> json) => KasusKelompokUmur(
    currentData: json["current_data"] == null ? null : json["current_data"],
    missingData: json["missing_data"] == null ? null : json["missing_data"].toDouble(),
    listData: json["list_data"] == null ? null : List<KelompokUmurListDatum>.from(json["list_data"].map((x) => KelompokUmurListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "current_data": currentData == null ? null : currentData,
    "missing_data": missingData == null ? null : missingData,
    "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class KelompokUmurListDatum {
  KelompokUmurListDatum({
    this.key,
    this.docCount,
    this.usia,
  });

  String key;
  double docCount;
  Usia usia;

  factory KelompokUmurListDatum.fromJson(Map<String, dynamic> json) => KelompokUmurListDatum(
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"].toDouble(),
    usia: json["usia"] == null ? null : Usia.fromJson(json["usia"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
    "usia": usia == null ? null : usia.toJson(),
  };
}

class Usia {
  Usia({
    this.value,
  });

  double value;

  factory Usia.fromJson(Map<String, dynamic> json) => Usia(
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
  };
}

class Meninggal {
  Meninggal({
    this.kondisiPenyerta,
    this.jenisKelamin,
    this.kelompokUmur,
    this.gejala,
  });

  MeninggalGejala kondisiPenyerta;
  MeninggalGejala jenisKelamin;
  MeninggalKelompokUmur kelompokUmur;
  MeninggalGejala gejala;

  factory Meninggal.fromJson(Map<String, dynamic> json) => Meninggal(
    kondisiPenyerta: json["kondisi_penyerta"] == null ? null : MeninggalGejala.fromJson(json["kondisi_penyerta"]),
    jenisKelamin: json["jenis_kelamin"] == null ? null : MeninggalGejala.fromJson(json["jenis_kelamin"]),
    kelompokUmur: json["kelompok_umur"] == null ? null : MeninggalKelompokUmur.fromJson(json["kelompok_umur"]),
    gejala: json["gejala"] == null ? null : MeninggalGejala.fromJson(json["gejala"]),
  );

  Map<String, dynamic> toJson() => {
    "kondisi_penyerta": kondisiPenyerta == null ? null : kondisiPenyerta.toJson(),
    "jenis_kelamin": jenisKelamin == null ? null : jenisKelamin.toJson(),
    "kelompok_umur": kelompokUmur == null ? null : kelompokUmur.toJson(),
    "gejala": gejala == null ? null : gejala.toJson(),
  };
}

class MeninggalGejala {
  MeninggalGejala({
    this.listData,
  });

  List<GejalaListDatum> listData;

  factory MeninggalGejala.fromJson(Map<String, dynamic> json) => MeninggalGejala(
    listData: json["list_data"] == null ? null : List<GejalaListDatum>.from(json["list_data"].map((x) => GejalaListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class MeninggalKelompokUmur {
  MeninggalKelompokUmur({
    this.listData,
  });

  List<KelompokUmurListDatum> listData;

  factory MeninggalKelompokUmur.fromJson(Map<String, dynamic> json) => MeninggalKelompokUmur(
    listData: json["list_data"] == null ? null : List<KelompokUmurListDatum>.from(json["list_data"].map((x) => KelompokUmurListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class ListPerkembangan {
  ListPerkembangan({
    this.tanggal,
    this.kasus,
    this.meninggal,
    this.sembuh,
    this.dirawatOrIsolasi,
    this.akumulasiKasus,
    this.akumulasiSembuh,
    this.akumulasiMeninggal,
    this.akumulasiDirawatOrIsolasi,
  });

  int tanggal;
  int kasus;
  int meninggal;
  int sembuh;
  int dirawatOrIsolasi;
  int akumulasiKasus;
  int akumulasiSembuh;
  int akumulasiMeninggal;
  int akumulasiDirawatOrIsolasi;

  factory ListPerkembangan.fromJson(Map<String, dynamic> json) => ListPerkembangan(
    tanggal: json["tanggal"] == null ? null : json["tanggal"],
    kasus: json["KASUS"] == null ? null : json["KASUS"],
    meninggal: json["MENINGGAL"] == null ? null : json["MENINGGAL"],
    sembuh: json["SEMBUH"] == null ? null : json["SEMBUH"],
    dirawatOrIsolasi: json["DIRAWAT_OR_ISOLASI"] == null ? null : json["DIRAWAT_OR_ISOLASI"],
    akumulasiKasus: json["AKUMULASI_KASUS"] == null ? null : json["AKUMULASI_KASUS"],
    akumulasiSembuh: json["AKUMULASI_SEMBUH"] == null ? null : json["AKUMULASI_SEMBUH"],
    akumulasiMeninggal: json["AKUMULASI_MENINGGAL"] == null ? null : json["AKUMULASI_MENINGGAL"],
    akumulasiDirawatOrIsolasi: json["AKUMULASI_DIRAWAT_OR_ISOLASI"] == null ? null : json["AKUMULASI_DIRAWAT_OR_ISOLASI"],
  );

  Map<String, dynamic> toJson() => {
    "tanggal": tanggal == null ? null : tanggal,
    "KASUS": kasus == null ? null : kasus,
    "MENINGGAL": meninggal == null ? null : meninggal,
    "SEMBUH": sembuh == null ? null : sembuh,
    "DIRAWAT_OR_ISOLASI": dirawatOrIsolasi == null ? null : dirawatOrIsolasi,
    "AKUMULASI_KASUS": akumulasiKasus == null ? null : akumulasiKasus,
    "AKUMULASI_SEMBUH": akumulasiSembuh == null ? null : akumulasiSembuh,
    "AKUMULASI_MENINGGAL": akumulasiMeninggal == null ? null : akumulasiMeninggal,
    "AKUMULASI_DIRAWAT_OR_ISOLASI": akumulasiDirawatOrIsolasi == null ? null : akumulasiDirawatOrIsolasi,
  };
}
