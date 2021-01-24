import 'package:flutter/material.dart';
import 'package:sarina/data/network/responses/response_kabupaten.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
  import 'package:sarina/utils/size_config.dart';
  import 'package:sarina/utils/refresh.dart';
  import 'input_data_kapasitas_bpdb_page.dart';
import 'input_informasi_bencana.dart';
import 'input_sarana_prasarana.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProvinsiPage extends StatefulWidget {
  String title = "";
  String id_prov = "";
  String name = "";

  ProvinsiPage({this.title, this.id_prov,this.name});

  @override
  _ProvinsiPageState createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {
  List<Datum> list_city = [];
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void initState() {

    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    getCity();
    super.initState();
  }


    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHight / 5,
                color: blueColors,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHight / 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Cari",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildListCity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListCity() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
          itemCount: list_city.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, i) {
            return filter == null || filter == ""?
             Center(
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        '${list_city[i].regenciesName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        if (widget.title == "Data Kapasitas BPBD") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InputBPDBPage(kab_id: list_city[i].id.toString(),kab: list_city[i].regenciesName,
                                prov:widget.name,prov_id: widget.id_prov,)));
                        } else if (widget.title == "Data Sarana Prasarana") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  InputSaranaPrasaranaPage(kab_id: list_city[i].id.toString(),kab: list_city[i].regenciesName,
                                    prov:widget.name,prov_id: widget.id_prov)));
                        } else if (widget.title == "Data Informasi Bencana") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InformasiBencanaPage(kab_id: list_city[i].id.toString(),kab: list_city[i].regenciesName,
                                  prov:widget.name,prov_id:widget.id_prov)));
                        }
                      },
                    ),
                  ),
                )):'${list_city[i].regenciesName}'
                .toLowerCase()
                .contains(filter.toLowerCase())? Center(
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        '${list_city[i].regenciesName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        if (widget.title == "Data Kapasitas BPBD") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InputBPDBPage(kab_id: list_city[i].id.toString(),kab: list_city[i].regenciesName,
                                prov:widget.name,prov_id: widget.id_prov,)));
                        } else if (widget.title == "Data Sarana Prasarana") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  InputSaranaPrasaranaPage()));
                        } else if (widget.title == "Data Informasi Bencana") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InformasiBencanaPage(kab_id: list_city[i].id.toString(),kab: list_city[i].regenciesName,
                                  prov:widget.name,prov_id:widget.id_prov)));
                        }
                      },
                    ),
                  ),
                )):Container();
          }),
    );
  }

  Future<List<Datum>> get_city() async {
    return new Future.delayed(new Duration(seconds: 3), () {
      return list_city;
    });
  }

  void getCity() {
    ServiceApiConfig().getCity(widget.id_prov).then((val) {
      setState(() {
        list_city = val.data;
      });
    }).catchError((_) {});
  }
}
