import 'package:flutter/material.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DetailGambarKegiatan extends StatefulWidget {
  String img;
  String gbr;
  DetailGambarKegiatan({this.img,this.gbr});

  @override
  _DetailGambarKegiatanState createState() => _DetailGambarKegiatanState();
}

class _DetailGambarKegiatanState extends State<DetailGambarKegiatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: widget.gbr,
                child: Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Container(
                    child: Center(
                      child: Image.network(
                        widget.img,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}