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
      // List<UserModel> user = List<UserModel>();
      getUserData();
    }
    getUserData(){
   
    users = List<UserModel>();
    chats = List<ChatContentModel>();
    data.forEach((item){
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
  List data = [
    {
      "id": "2149cbd6f1fbd070ff9045e648764ab6",
      "url_token": "ji-yi-85-34",
      "name": "记忆",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic1.zhimg.com/v2-0aa271fdadb3130a549af500c4d4569a_is.jpg",
      "avatar_url_template":
          "https://pic1.zhimg.com/v2-0aa271fdadb3130a549af500c4d4569a_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/ji-yi-85-34",
      "user_type": "people",
      "headline": "",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 0,
      "answer_count": 0,
      "articles_count": 0
    },
    {
      "id": "04d44e85c074c4b22775375886576303",
      "url_token": "leyls-50",
      "name": "Leyls",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic2.zhimg.com/v2-d2f3715564b0b40a8dafbfdec3803f97_is.jpg",
      "avatar_url_template":
          "https://pic2.zhimg.com/v2-d2f3715564b0b40a8dafbfdec3803f97_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/leyls-50",
      "user_type": "people",
      "headline": "",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 0,
      "answer_count": 0,
      "articles_count": 0
    },
    
    {
      "id": "92c3e7514fb0a5a71c4d23432fe321af",
      "url_token": "ihowe",
      "name": "haroel",
      "use_default_avatar": false,
      "avatar_url": "https://pic2.zhimg.com/87cdbc0fb_is.jpg",
      "avatar_url_template": "https://pic2.zhimg.com/87cdbc0fb_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/ihowe",
      "user_type": "people",
      "headline": "Yo~~ listen up here\u0026#39;s a story",
      "gender": 1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 191,
      "answer_count": 359,
      "articles_count": 0
    },
    {
      "id": "fc1fa66ab4b9b660806d50dcfd7012aa",
      "url_token": "ling-dong-you-feng",
      "name": "灵动游峰",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic2.zhimg.com/v2-6d1f871ecf2ebbaef30ef4ab7b96a3d0_is.jpg",
      "avatar_url_template":
          "https://pic2.zhimg.com/v2-6d1f871ecf2ebbaef30ef4ab7b96a3d0_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/ling-dong-you-feng",
      "user_type": "people",
      "headline": "小论文和大论文的区别",
      "gender": 1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 1,
      "answer_count": 0,
      "articles_count": 0
    },
    {
      "id": "4e6d8d84c9d26c1c8ea2f5afe260247d",
      "url_token": "mo-mo-mo-mo-39-75",
      "name": "嘿嘿嘿嘿",
      "use_default_avatar": true,
      "avatar_url": "https://pic4.zhimg.com/da8e974dc_is.jpg",
      "avatar_url_template": "https://pic4.zhimg.com/da8e974dc_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/mo-mo-mo-mo-39-75",
      "user_type": "people",
      "headline": "",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 6,
      "answer_count": 0,
      "articles_count": 0
    },
    {
      "id": "1b65a94bdf04f8bedc510a000f67a49d",
      "url_token": "edward-47-15",
      "name": "Edward",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic2.zhimg.com/v2-3b757736ac5b92e8ba0d039569a0b08d_is.jpg",
      "avatar_url_template":
          "https://pic2.zhimg.com/v2-3b757736ac5b92e8ba0d039569a0b08d_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/edward-47-15",
      "user_type": "people",
      "headline": "",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 3,
      "answer_count": 0,
      "articles_count": 0
    },
    {
      "id": "dd441c0dc5047cf97645585e5baae599",
      "url_token": "zengchao",
      "name": "曾超",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic3.zhimg.com/v2-550a2af4dc30317194950b6a371192f1_is.jpg",
      "avatar_url_template":
          "https://pic3.zhimg.com/v2-550a2af4dc30317194950b6a371192f1_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/zengchao",
      "user_type": "people",
      "headline": "企业SaaS行业从业者，企客宝+企搜客产品经理",
      "gender": 1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 72,
      "answer_count": 85,
      "articles_count": 0
    },
    {
      "id": "9ab2f6ae276549d9129b4fa67c25e33a",
      "url_token": "li-oo",
      "name": "李oo",
      "use_default_avatar": true,
      "avatar_url": "https://pic4.zhimg.com/da8e974dc_is.jpg",
      "avatar_url_template": "https://pic4.zhimg.com/da8e974dc_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/li-oo",
      "user_type": "people",
      "headline": "呵呵",
      "gender": 1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 11,
      "answer_count": 35,
      "articles_count": 0
    },
    {
      "id": "ce928cf7539fc6f8360ff5f5baab64ca",
      "url_token": "xin-di-de-zi-you",
      "name": "心底的自由",
      "use_default_avatar": true,
      "avatar_url": "https://pic4.zhimg.com/da8e974dc_is.jpg",
      "avatar_url_template": "https://pic4.zhimg.com/da8e974dc_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/xin-di-de-zi-you",
      "user_type": "people",
      "headline": "",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 0,
      "answer_count": 0,
      "articles_count": 0
    },
    {
      "id": "0e4b7c6a6ae7075d04f46ea3cf8afa22",
      "url_token": "huyuguo",
      "name": "胡玉国",
      "use_default_avatar": false,
      "avatar_url":
          "https://pic4.zhimg.com/v2-28e61ae8e1f56afd3f4f943155cd1af3_is.jpg",
      "avatar_url_template":
          "https://pic4.zhimg.com/v2-28e61ae8e1f56afd3f4f943155cd1af3_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/huyuguo",
      "user_type": "people",
      "headline": "",
      "gender": 1,
      "is_advertiser": false,
      "vip_info": {
        "is_vip": true,
        "rename_days": "60",
        "vip_icon": {
          "url":
              "https://pic3.zhimg.com/v2-4812630bc27d642f7cafcd6cdeca3d7a_r.png",
          "night_mode_url":
              "https://pic3.zhimg.com/v2-c9686ff064ea3579730756ac6c289978_r.png"
        }
      },
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 0,
      "answer_count": 1,
      "articles_count": 1
    },
    {
      "id": "7757793cd034b9ef8f654c8ab0a5117a",
      "url_token": "spring-9-46",
      "name": "spring",
      "use_default_avatar": true,
      "avatar_url": "https://pic4.zhimg.com/da8e974dc_is.jpg",
      "avatar_url_template": "https://pic4.zhimg.com/da8e974dc_{size}.jpg",
      "is_org": false,
      "type": "people",
      "url": "https://www.zhihu.com/people/spring-9-46",
      "user_type": "people",
      "headline": "IT工程师",
      "gender": -1,
      "is_advertiser": false,
      "vip_info": {"is_vip": false, "rename_days": "60"},
      "badge": [],
      "is_following": false,
      "is_followed": true,
      "follower_count": 0,
      "answer_count": 0,
      "articles_count": 0
    }
  ];
}