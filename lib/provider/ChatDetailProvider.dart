//  处理聊天详情 和发消息的 provider

import 'package:flutter/material.dart';
import 'package:letschat/Model/chatModel.dart';
import 'package:letschat/utils/staticMembers.dart';

class ChatDetailProvider with ChangeNotifier{
  List<ChatModel> chats;
  
  ChatDetailProvider(){
     getChatDetail();
  }
  getChatDetail(){
      chats = List<ChatModel>();
       chatDetails.forEach((chat){
          chats.add(ChatModel(sender: chat["sender"],content: chat["content"],avatarUrl: chat["avatarUrl"],chatType: chat["chatType"]));
       });
       notifyListeners();
  }
  sendMessage(content){
    chats.add(ChatModel(sender: 1,content: content,avatarUrl: "https://pic4.zhimg.com/v2-f33d1a1fee3bd54c0d44fc0aa8522cd2_is.jpg",chatType: CHATTYPE.TEXT));
    notifyListeners();
  }
  sendVoice(path){
    chats.add(ChatModel(sender: 1,content: path,avatarUrl: "https://pic4.zhimg.com/v2-f33d1a1fee3bd54c0d44fc0aa8522cd2_is.jpg",chatType: CHATTYPE.VOICE));
    notifyListeners();
  }
  List chatDetails = [
    {
      "sender": 0,
      "content": "你吃了吗",
      "avatarUrl": 'https://pic2.zhimg.com/v2-6d1f871ecf2ebbaef30ef4ab7b96a3d0_is.jpg',
      "chatType": CHATTYPE.TEXT
    },
    {
      "sender": 1,
      "content": "吃了",
      "avatarUrl": 'https://pic4.zhimg.com/v2-f33d1a1fee3bd54c0d44fc0aa8522cd2_is.jpg',
      "chatType": CHATTYPE.TEXT
    },
  ];
}