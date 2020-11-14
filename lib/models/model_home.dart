
class DashboardItems {
  String title;
  String subtitle;
  String event;
  String img;
  DashboardItems({this.title, this.subtitle, this.event, this.img});
}
class ModelItemUndangan{
  String judul;
  String Deskripsi;
  String tglPelaksanan;
  String WaktuPelaksana;

  ModelItemUndangan({this.judul, this.Deskripsi, this.tglPelaksanan, this.WaktuPelaksana});
}

class ModelBeritaTerkait{
  String judul;
  String Deskripsi;
  String img;

  ModelBeritaTerkait({this.judul, this.Deskripsi, this.img});
}