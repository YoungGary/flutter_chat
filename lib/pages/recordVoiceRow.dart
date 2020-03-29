import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letschat/provider/ChatDetailProvider.dart';
import 'package:letschat/provider/voiceRecordProvider.dart';
import 'package:letschat/utils/staticMembers.dart';
import 'package:provider/provider.dart';
class RecordVoiceRow extends StatelessWidget {
  const RecordVoiceRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoiceRecordProvider provider = Provider.of<VoiceRecordProvider>(context);
     // 引入 聊天详情的provider
    ChatDetailProvider chatProvider = Provider.of<ChatDetailProvider>(context);
    double rpx = MediaQuery.of(context).size.width / 750;
   
    return GestureDetector(
        onTapDown: (result) {
          provider.beginRecord();
          // provider.updateVoiceRecord();
        },
        
        onTapUp: (result) {
           provider.stopRecord();
          String resultPath = provider.uploadPath;
          // String mp3Path = provider.uploadPath;
          // if (Platform.isIOS) {
          //   resultPath = resultPath.replaceAll(MEDIATYPE.M4A, MEDIATYPE.PCM);
          //   mp3Path = mp3Path.replaceAll(MEDIATYPE.M4A, MEDIATYPE.MP3);
          // } else {
          //   resultPath = resultPath.replaceAll(MEDIATYPE.MP4, MEDIATYPE.PCM);
          //   mp3Path = mp3Path.replaceAll(MEDIATYPE.MP4, MEDIATYPE.MP3);
          // }
          chatProvider.sendVoice(resultPath);
          // String cmdMP3 =
          //     NativeTool.cmdForRecordToMp3(provider.uploadPath, mp3Path);
          // String cmdPCM = NativeTool.cmdForRecordToPCM(mp3Path, resultPath);
          // runXFVoiceVTT(
          //     cmdMP3, cmdPCM, resultPath, provider.uploadPath, mp3Path);
        },
        onTapCancel: () {
          provider.cancelRecord();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 86 * rpx,
          color: provider.ifTap ? Colors.grey[600] : Colors.white,
          child: Center(
              child: Container(
                  child: Text(
            '按住 说话',
            style: TextStyle(fontSize: 30 * rpx),
          ))),
        ));
  }
}