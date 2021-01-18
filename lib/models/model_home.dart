
class DashboardItems {
  String title;
  String subtitle;
  String event;
  String img;
  DashboardItems({this.title, this.subtitle, this.event, this.img});
}
class ModelItemUndangan{
  String id;
  String judul;
  String Deskripsi;
  String tglPelaksanan;
  String WaktuPelaksana;
  String eventType;

  ModelItemUndangan({this.id,this.judul, this.Deskripsi, this.tglPelaksanan, this.WaktuPelaksana,this.eventType});
}

class GambarKegiatan{
  String img;

  GambarKegiatan({this.img});
}

class ModelPengaduan{
  String judul;
  String Deskripsi;
  String status;

  ModelPengaduan({this.judul, this.Deskripsi, this.status});
}

class ModelBeritaTerkait{
  String judul;
  String Deskripsi;
  String img;

  ModelBeritaTerkait({this.judul, this.Deskripsi, this.img});
}