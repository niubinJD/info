import 'package:flutter/material.dart';
import 'package:infos/infolist/modal/info.dart';
import 'info_fill.dart';
import 'util/shared_service.dart';
class InfoDetailPage extends StatefulWidget{
  InfoDetailPage({this.info});
  InfoModal info;
  @override
  _InfoDetailPageState createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage>{
  SharedService _service = new SharedService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.info.name),
        actions: <Widget>[
          GestureDetector(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Text('修改'),
              ),
            ),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new InfoFill(type: Type.update,info: widget.info,);
              }));
            },
          ),
        ],
      ),
      body:  Card(
        elevation: 1.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: new Icon(Icons.account_box),
              title: Text(widget.info.account),
            ),
            ListTile(
              leading: new Icon(Icons.lock),
              title: Text(widget.info.password),
            ),
            ListTile(
              leading: new Icon(Icons.description),
              title: Text(widget.info.description),
              subtitle: Text(widget.info.description == '' ? '这个人很懒，什么也没有留下！' : ''),
            )
          ],
        ),
      )
    );
  }
}