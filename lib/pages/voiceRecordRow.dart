import 'dart:ffi';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:letschat/provider/voiceRecordProvider.dart';
import 'package:letschat/utils/staticMembers.dart';
import 'package:provider/provider.dart';
import 'ChatRow.dart';

class VoiceRecordRow extends StatelessWidget {
  const VoiceRecordRow(
      {Key key, @required this.sender,
      @required this.path,
      @required this.avatarUrl,
      @required this.voiceDuration,})
      : super(key: key);

  final int sender; // 0 自己

  final String path;

  final String avatarUrl;
  final int voiceDuration; 

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    VoiceRecordProvider provider = Provider.of<VoiceRecordProvider>(context);
    return GestureDetector(
        onTap: () {
          provider.playVoice(path);
        },
        child:  Container(
      padding: EdgeInsets.symmetric(horizontal: 20*rpx,vertical: 20*rpx),
      child: Row(
        mainAxisAlignment:
            sender == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          sender == 0
              ? CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                )
              : Container(),
          sender == 0
              ? Container(
                  padding: EdgeInsets.only(left: 10*rpx),
                  child: CustomPaint(
                      painter: ChatBoxPainter(
                          color:
                              sender == 0 ? Colors.greenAccent : Colors.white,
                          width: 20 * rpx,
                          height: 20 * rpx)),
                )
              : Container(),
          Container(
            width: 100 * rpx,
            padding: EdgeInsets.all(12*rpx),
            margin: EdgeInsets.only(left: sender == 1? 0:18*rpx,right: sender ==1 ? 18*rpx:0),
            decoration: BoxDecoration(
                color: sender == 0 ? Colors.greenAccent : Colors.white,
                borderRadius: BorderRadius.circular(10 * rpx)),
            child: Row(
              mainAxisAlignment: sender == SENDER.SELF
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: <Widget>[
                sender == SENDER.SELF
                    ? Text(voiceDuration.toString())
                    : Transform.rotate(angle: pi / 2, child: Icon(Icons.wifi)),
                sender == SENDER.SELF
                    ? Transform.rotate(angle: -pi / 2, child: Icon(Icons.wifi))
                    : Text(voiceDuration.toString())
              ],
            ),
          ),
          sender == 1
              ? Transform.rotate(
                  angle: pi,
                  child: Container(
                    // padding: EdgeInsets.only(top: 20 * rpx),
                    child: CustomPaint(
                        painter: ChatBoxPainter(
                            color:
                                sender == 0 ? Colors.greenAccent : Colors.white,
                            width: 20 * rpx,
                            height: 20 * rpx)),
                  ),
                )
              : Container(),
              sender == 1
              ? CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                )
              : Container(),
        ],
      ),
    ));
  }
}


