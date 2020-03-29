import 'package:flutter/material.dart';
import 'dart:math';
class ChaRow extends StatelessWidget {
  const ChaRow(
      {Key key,
      @required this.sender,
      @required this.content,
      @required this.avatarUrl})
      : super(key: key);

  final int sender; // 0 自己

  final String content;

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Container(
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
            child: Text(content),
            margin: EdgeInsets.only(left: sender == 1? 0:18*rpx,right: sender ==1 ? 18*rpx:0),
            padding: EdgeInsets.all(18*rpx),
            decoration: BoxDecoration(
                color: sender == 0 ? Colors.greenAccent : Colors.white,
                borderRadius: BorderRadius.circular(10 * rpx)),
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
    );
  }
}

class ChatBoxPainter extends CustomPainter {
  ChatBoxPainter(
      {@required this.width, @required this.height, @required this.color});
  final double width;
  final double height;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, height / 2)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..lineTo(0, height / 2);
    Paint p = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(ChatBoxPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ChatBoxPainter oldDelegate) => false;
}