import 'package:flutter/material.dart';
import 'package:infos/infolist/modal/info.dart';
import 'package:infos/info_detail_page.dart';

class InfoListItem extends StatelessWidget {
  final InfoModal _infoModal;

  InfoListItem(this._infoModal);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: new CircleAvatar(child: new Text('密')),
        title: new Text(_infoModal.name),
        subtitle: new Text(_infoModal.description),
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new InfoDetailPage(info: _infoModal,);
          }));
        }
    );
  }
}
