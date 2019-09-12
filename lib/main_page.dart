import 'package:flutter/material.dart';
import 'util/storage_service.dart';
import 'util/encrypt_util.dart';
import 'package:infos/infolist/modal/storage.dart';
import 'dart:convert';
import 'info_page.dart';
import 'util/shared_service.dart';
import 'info_fill.dart';
import 'package:infos/infolist/modal/info.dart';
import 'util/util.dart';
import 'package:flutter/services.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String _widgetTitle = '信息列表';
  StorageService _storageService = new StorageService();
  SharedService _service = new SharedService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          await pop();
          return true;
        },
        child: new MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text(_widgetTitle),
            ),
            body: new InfoPage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new InfoFill(type: Type.create, info: _getEmptyModal());
                }));
              },
              tooltip: '新建',
              child: Icon(Icons.add),
            ),
          ),
        )
    );
  }
  /**
   * 加载数据
   */
  _loadData() async {
    _storageService.readData().then((data) {
      if (data == null || data == "") {
        return;
      }
      Future<String> future = EncryptUtil.decrypt(data);
      future.then((value) {
        var storage = Storage.fromJson(json.decode(value));
        setState(() {
          _service.data = storage.data;
        });
      });
    });

  }

  InfoModal _getEmptyModal() {
    return new InfoModal(
        uuid: Util.generateUuid(),
        name: '',
        account: '',
        password: '',
        description: ''
    );
  }

  Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}