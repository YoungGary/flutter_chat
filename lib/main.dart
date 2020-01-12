import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letschat/provider/chalist.dart';
import 'package:provider/provider.dart';
import './pages/setting.dart';
import 'pages/chatDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'letschat',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Tabbars());
  }
}

class Tabbars extends StatefulWidget {
  Tabbars({Key key}) : super(key: key);

  @override
  _TabbarsState createState() => _TabbarsState();
}

class _TabbarsState extends State<Tabbars> {
  int _currentIndex;
  List _pageList = [Chatlist(), SettingPage()];
  List _appBarlist = [
    AppBar(
      title: Text("主页"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {},
        ),
      ],
    ),
    AppBar(
      title: Text("设置"),
      centerTitle: true,
    )
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this._appBarlist[this._currentIndex],
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ChatListProvider(),
          )
        ],
        child: this._pageList[this._currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 24.0, //icon的大小
        fixedColor: Colors.blueGrey, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs固定模式
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置"))
        ],
      ),
    );
  }
}

class Chatlist extends StatelessWidget {
  const Chatlist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatListProvider provider = Provider.of<ChatListProvider>(context);
    if (provider.chats == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      // print(provider.chats);
      return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.chats.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context)=>DetailPage()
                      )
                    );
                  },
                  child: ListTile(
                    leading: Image.network(
                        provider.chats[index].userIds[0].avatarUrl),
                    title: Text(provider.chats[index].userIds[0].userName),
                    subtitle: Text(provider.chats[index].lastContent),
                    trailing: Text(provider.chats[index].lastUpdateTime)),
                ),   
                Divider(
                  height: 1,
                )
              ],
            );
          });
    }
  }
}
