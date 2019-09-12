import 'package:flutter/material.dart';
import 'package:infos/infolist/info_list_item.dart';
import 'util/shared_service.dart';
class InfoPage extends StatefulWidget {
  InfoPage({Key key}) : super(key: key);

  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  SharedService service = new SharedService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new ListView.builder(
      itemCount: service.data.length,
      itemBuilder: (context, index) {
        final item = service.data[index];
//        final itemName = item.name;
        return new Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify Widgets.
          key: new Key(item.uuid),
          // We also need to provide a function that will tell our app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            service.remove(item.uuid);
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("${item.name}已被删除！")));
          },
          // Show a red background as the item is swiped away
          background: new Container(color: Colors.white),
          child: new InfoListItem(item),
        );
      },
    ),
    );
  }
}
