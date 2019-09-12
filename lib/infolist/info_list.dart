import 'package:flutter/material.dart';
import 'package:infos/infolist/info_list_item.dart';
import 'package:infos/infolist/modal/info.dart';

class InfoList extends StatelessWidget {
  final List<InfoModal> _infoModal;

  InfoList(this._infoModal);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<InfoListItem> _buildContactsList() {
    List<InfoListItem> list = <InfoListItem>[];
    for(var i = 0; i < _infoModal.length; i++){
      list.add(new InfoListItem(_infoModal.elementAt(i)));
    }
    return list;
  }
}
