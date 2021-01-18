import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

import 'dart:math' as Math;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

import 'detail_gambar_kegiatan.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DetailUndanganPage extends StatefulWidget {
  ModelItemUndangan modelItemUndangan;

  DetailUndanganPage({this.modelItemUndangan});

  @override
  _DetailUndanganPageState createState() => _DetailUndanganPageState();
}

class _DetailUndanganPageState extends State<DetailUndanganPage> {
  List<GambarKegiatan> listGambar = [];
  File _image;
  String token;
  final storage = new FlutterSecureStorage();


  @override
  void initState() {
    addImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget desk = Html(
      data: widget.modelItemUndangan.Deskripsi,
      //Optional parameters:
      onLinkTap: (url) {
        // open url in a webview
      },
      onImageTap: (src) {
        // Display the image in large form.
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelItemUndangan.judul),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: SizeConfig.screenHight / 3,
              width: SizeConfig.screenWidth,
              child: Card(
                elevation: 4,
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            widget.modelItemUndangan.eventType,
                            style: TextStyle(
                                fontSize: SizeConfig.blockVertical * 3),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.modelItemUndangan.tglPelaksanan +
                                ": ${widget.modelItemUndangan.WaktuPelaksana}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockVertical * 2),
                          ),
                          desk
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              height: SizeConfig.screenHight / 2,
              child: GridView.builder(
                itemCount: listGambar.length,
                itemBuilder: (context, index) {
                  return listGambar.length < 1
                      ? Container
                      : Center(
                          child: listGambar[index].img == "addData"
                              ? addImages(context)
                              : Container(
                                  child: new Hero(
                                  tag: "gambar" + index.toString(),
                                  child: new Material(
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailGambarKegiatan(
                                                      img:
                                                          listGambar[index].img,
                                                      gbr: "gambar" +
                                                          index.toString()))),
                                      child: Image.network(
                                        listGambar[index].img,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                                  // Image.network(listGambar[index].img,width: 200,height: 200,fit: BoxFit.cover,)
                                  ));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addImages(BuildContext context) {
    return Container(
      height: 200,
      child: InkWell(
        onTap: (){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Tambah Gallery',
            body:  Center(
              child: _image==null
                  ? new Text("No image selected!")
                  : Column(
                    children: [
                      new Image.file(_image),
                      FlatButton(
                        onPressed: () {
                          upload(_image,context,token);
                        },
                        child: Text('Upload this Image'),
                        shape: StadiumBorder(),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
            ),
            desc: '',
            btnCancelText: 'Via Gallery',
            btnOkText: 'Via Camera',
            btnCancelOnPress: () {
              getImageGallery();
            },
            btnOkOnPress: () {
              getImageCamera();
            },
          )..show();
        },
        child: Card(
            elevation: 4,
            child: _image==null
                ? Center(
                child: Icon(
                  Icons.add,
                  size: 40,
                )) : new Image.file(_image),),
      ),
    );
  }

  void addImage() async{
    token = await storage.read(key: TOKEN_LOGIN);
    setState(() {
      listGambar.add(new GambarKegiatan(
          img:
              "https://res.cloudinary.com/practicaldev/image/fetch/s--xjV2-xvw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/psw782jgf7z3dl08tcag.jpg"));
      listGambar.add(new GambarKegiatan(
          img:
              "https://res.cloudinary.com/practicaldev/image/fetch/s--xjV2-xvw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/psw782jgf7z3dl08tcag.jpg"));
      listGambar.add(new GambarKegiatan(
          img:
              "https://res.cloudinary.com/practicaldev/image/fetch/s--xjV2-xvw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/psw782jgf7z3dl08tcag.jpg"));
      listGambar.add(new GambarKegiatan(
          img:
              "https://res.cloudinary.com/practicaldev/image/fetch/s--xjV2-xvw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/psw782jgf7z3dl08tcag.jpg"));
      listGambar.add(new GambarKegiatan(img: "addData"));
    });
  }


  Future getImageGallery() async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir =await getTemporaryDirectory();
    final path = tempDir.path;

    int rand= new Math.Random().nextInt(100000);

    Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image,height: 500,width: 500);

    var compressImg= new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

    final tempDir =await getTemporaryDirectory();
    final path = tempDir.path;

    int rand= new Math.Random().nextInt(100000);

    Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image,height: 500,width: 500);

    var compressImg= new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


    setState(() {
      _image = compressImg;
    });
  }


  Future upload(File imageFile, BuildContext context, String token) async{
    Map<String, String> headers = { "Authorization": "Bearer $token"};
    var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length= await imageFile.length();
    var uri = Uri.parse("https://lencanaapi2020.herokuapp.com/api/v1/gallery/submit");
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    var multipartFile = new http.MultipartFile("photo", stream, length, filename: basename(imageFile.path));
    request.fields['EVENT_ID'] = "${widget.modelItemUndangan.id}";
    request.files.add(multipartFile);
    var response = await request.send();

    if(response.statusCode==200){
      Navigator.pop(context);
      showToast(context, "Image Uploaded");
    }else{
      showToast(context, "Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

}
