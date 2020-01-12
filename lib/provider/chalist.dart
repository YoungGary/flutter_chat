import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letschat/Model/chatContentModel.dart';
import 'package:letschat/Model/userModel.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
Dio dio = new Dio();
class ChatListProvider with ChangeNotifier{
    List<ChatContentModel> chats;
    List<UserModel> users ;
    ChatListProvider(){
      List<UserModel> user = List<UserModel>();
      getUserData();
    }
    Future getUserData() async {
    var response = await dio.get("http://mock.mvpgary.top/mock/5e1ae47e83c3260026d92ab6/chat/getUserInfo");
    var data  = response.data;
    List<Map> list = (data['data'] as List).cast(); 
    // print(list);
     users = List<UserModel>();
     chats = List<ChatContentModel>();
    list.forEach((item){
       users.add(UserModel(avatarUrl:item['avatar_url'],userId: Uuid().v4(),userName: item['name'],ifMale:true));
    });
    users.toList().forEach((item){
      List<UserModel> userIds = List<UserModel>();
      userIds.add(item);
      chats.add(ChatContentModel(
         userIds:userIds,
         ifRead: false, 
         lastContent: '这是最后一条信息了',
         lastUpdateTime: genRandomTime()));
    });
    notifyListeners();
  }
  genRandomTime(){
    int random = Random().nextInt(1000000000);
    DateTime noe = DateTime.now();
    DateTime rantime = DateTime.fromMillisecondsSinceEpoch(noe.millisecondsSinceEpoch-random);
    Duration duration = noe.difference(rantime);
    if (duration.inDays > 0) {
      return '${duration.inDays}天前';
    }
    else if(duration.inHours>0 && duration.inDays == 0){
      return '${duration.inHours}小时前';
    }
    else if(duration.inMinutes > 0 && duration.inHours == 0 && duration.inDays == 0){
      return '${duration.inMinutes}分钟前';
    }else{
      return '刚刚';
    }
    // return rantime.toString();
  }
}