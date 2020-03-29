import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letschat/pages/recordVoiceRow.dart';
import 'package:letschat/provider/ChatDetailProvider.dart';
import 'package:letschat/provider/voiceRecordProvider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:path/path.dart' as p;

class ChatBottomRow extends StatelessWidget {
  const ChatBottomRow({
    Key key,
    @required this.rpx,
    @required this.toBottom,
    @required this.txtController,
    @required this.voiceRecordProvider,
  }) : super(key: key);
  final double rpx;
  final double toBottom;
  final TextEditingController txtController;
  final VoiceRecordProvider voiceRecordProvider;
  @override
  Widget build(BuildContext context) {
    // 引入 聊天详情的provider
    ChatDetailProvider chatProvider = Provider.of<ChatDetailProvider>(context);
    return Container(
        color: Colors.grey[100],
        child: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            color: Colors.grey[100],
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 0),
            margin: EdgeInsets.only(bottom: toBottom),
            height: 110 * rpx,
            child: Row(
              children: <Widget>[
                voiceRecordProvider.ifVoiceRecord
                    ? OutlinedIconButton(
                        icon: Icon(Icons.keyboard),
                        onTap: () {
                          voiceRecordProvider.updateVoiceRecord();
                        },
                      )
                    : Transform.rotate(
                        angle: pi / 2,
                        child: OutlinedIconButton(
                          icon: Icon(Icons.wifi),
                          onTap: () {
                            voiceRecordProvider.updateVoiceRecord();
                          },
                        )),
                SizedBox(
                  width: 10 * rpx,
                ),
                
                Expanded(
                    child: voiceRecordProvider.ifVoiceRecord
                ? RecordVoiceRow():Container(
                        padding: EdgeInsets.symmetric(horizontal: 10 * rpx),
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          autocorrect: false,
                          controller: txtController,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (val) {
                            if (val.length > 0) {
                              chatProvider.sendMessage(txtController.text);
                              txtController.clear();
                            }
                          },
                        ))),
                SizedBox(
                  width: 10 * rpx,
                ),
                OutlinedIconButton(
                  icon: Icon(Icons.face),
                  onTap: () {},
                ),
                OutlinedIconButton(
                  icon: Icon(Icons.add),
                  onTap: () {
                    // bottomRowAnimProvider.runAnimation();
                  },
                ),
                SizedBox(
                  width: 10 * rpx,
                ),
              ],
            ),
          ),
          // ChatBottomFuncSheet(webRTCProvider: webRTCProvider,)
        ])));
  }
}

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({Key key, @required this.icon, @required this.onTap})
      : super(key: key);
  final Icon icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
        width: 60 * rpx,
        margin: EdgeInsets.all(10 * rpx),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(width: 4 * rpx)),
        child: IconButton(
          splashColor: Colors.transparent,
          icon: icon,
          iconSize: 40 * rpx,
          padding: EdgeInsets.all(0),
          onPressed: onTap,
        ));
  }
}
