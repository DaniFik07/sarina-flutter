
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_chat_room.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ChatRoom extends StatefulWidget {
  String penerima;
  String id;
  String gbr;
  String indx;

  ChatRoom({this.penerima,this.indx,this.id,this.gbr});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final storage = new FlutterSecureStorage();
  List<Chat> listChat = [];
  String user_id ="";
  String token ="";
  TextEditingController sendController = new TextEditingController();


  @override
  void initState() {
    getChat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Hero(
            tag: widget.indx,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('${widget.gbr}'),
            ),
          ),
          SizedBox(width: 10,),
          Text('${widget.penerima}'),
        ],
      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHight/1.3,
              child: ListView.builder(
                itemCount: listChat.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Container(
                          // ignore: unrelated_type_equality_checks
                          child: listChat[index].id  != null ?
                          ChatBubble(
                            clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 20),
                            backGroundColor: Colors.blue,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                "${listChat[index].chat}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ):
                          ChatBubble(
                            clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                            backGroundColor: Color(0xffE7E7ED),
                            margin: EdgeInsets.only(top: 20),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                "${listChat[index].chat}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _sendMessageArea()
          ],
        ),
      ),
    );
  }

  void getChat() async{
    listChat.clear();
    token = await storage.read(key: TOKEN_LOGIN);
    user_id = await storage.read(key: ID_USER);
    setState(() {});
    ServiceApiConfig().getChatRoom(token, widget.id, user_id).then((val){
    // ServiceApiConfig().getChatRoom(token, "7", "6").then((val){
      if(val.data.chats.length >0){
        setState(() {
          listChat = val.data.chats;
        });
      }
    }).catchError((_){

    });
  }
  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: SizeConfig.screenHight/10,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sendController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message..',
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              if(sendController.text.toString().isNotEmpty){
                ServiceApiConfig().sendMessage(user_id, widget.id, sendController.text, token).then((val){
                  if(val.msg == "Form Submitted"){
                    getChat();
                    sendController.text = "";
                    setState(() {});
                  }
                }).catchError((onError){
                  showToast(context, '$onError');
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
