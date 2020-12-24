import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

class InformasiBencanaPage extends StatefulWidget {
  String title;
  String kab_id;
  String kab = "";
  String prov = "";

  InformasiBencanaPage({this.title, this.kab_id,this.kab,this.prov});

  @override
  _InformasiBencanaPageState createState() => _InformasiBencanaPageState();
}

class _InformasiBencanaPageState extends State<InformasiBencanaPage> {
  String name = "";
  String address = "";
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    getPic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: () {},
          elevation: 3,
          backgroundColor: greenColors,
          label: Container(
            width: SizeConfig.screenWidth / 1.3,
            child: Text(
              "SUBMIT",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHight / 5,
                color: blueColors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHight / 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Form Input Informasi Bencana',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: SizeConfig.screenWidth,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Ketua Pelaksana BPDB Prov, ${widget.prov}, Kab ${widget.kab}',
                        style: TextStyle(color: abuAbu, fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        'Alamat Kantor',
                        style: TextStyle(color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$address',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Angin Topan",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Kekeringan",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "KARHUTLA",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Lainnya",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  'Kerugian Materi',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan di sini..',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  'Keterangan',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan di sini..',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPic() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    ServiceApiConfig().getPic(widget.kab_id, token).then((val) {
      if (val.data.length > 0) {
        setState(() {
          name = val.data[0].fullname;
          address = val.data[0].alamat;
        });
      }
    }).catchError((_) {});
  }
}
