import 'dart:math';
import 'package:letschat/pages/voiceRecordRow.dart';
import 'package:letschat/provider/bottomAnimationProvider.dart';
import 'package:letschat/provider/ChatDetailProvider.dart';
import 'package:letschat/provider/voiceRecordProvider.dart';
import 'package:letschat/utils/staticMembers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:letschat/provider/contentEditingProvider.dart';
import 'ChatRow.dart';
import 'bottomInputBar.dart';
import '../Model/chatModel.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     BottomRowAnimProvider bottomRowAnimProvider =Provider.of<BottomRowAnimProvider>(context);
    ContentEditingProvider contentEditingProvider = Provider.of<ContentEditingProvider>(context);
    VoiceRecordProvider voiceRecordProvider = Provider.of<VoiceRecordProvider>(context);
    TextEditingController txtController = contentEditingProvider.txtController;
    double toBottom = MediaQuery.of(context).viewInsets.bottom;
    txtController.addListener(() {
      contentEditingProvider.updateEditStatus(txtController);
    });
    return 
      Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("记忆"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          )
        ],
      ),
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          bottomRowAnimProvider.reverseAnim();
        },
        child:ChatDetailList(),
      ),
      bottomNavigationBar:Container(
        child:  ChatBottomRow(rpx: MediaQuery.of(context).size.width/750,toBottom: toBottom,txtController: txtController,voiceRecordProvider: voiceRecordProvider)
      )
      
    );
   
    
  }
}



class ChatDetailList extends StatelessWidget {
  const ChatDetailList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 引入 聊天详情的provider
     ChatDetailProvider chatProvider = Provider.of<ChatDetailProvider>(context);
    // print(chatProvider);
    List<ChatModel> chat = chatProvider.chats;
    return ListView.builder(
      itemCount: chat.length,
      itemBuilder: (BuildContext context, int index) {
        if(chat[index].chatType == CHATTYPE.TEXT){
          return ChaRow(
            sender: chat[index].sender,
            content: chat[index].content,
            avatarUrl: chat[index].avatarUrl,
          );
        }else if(chat[index].chatType == CHATTYPE.VOICE){
          return VoiceRecordRow(
            sender: chat[index].sender,
            path: chat[index].content,
            avatarUrl: chat[index].avatarUrl,
            voiceDuration:3
          );
        }else{
          return Container();
        }
      },
    );
  }
}


