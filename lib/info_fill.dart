import 'package:flutter/material.dart';
import 'package:infos/infolist/modal/info.dart';
import 'util/shared_service.dart';
class InfoFill extends StatefulWidget{
  InfoFill({@required this.type, @required this.info});
  Type type = Type.create;
  InfoModal info;

  @override
  _InfoFillState createState() => _InfoFillState();
}

class _InfoFillState extends State<InfoFill> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  SharedService _service = new SharedService();
  FocusNode _focusNode = new FocusNode();
  static final TextEditingController _firstNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.type == Type.create ? '新建' : '修改')
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: new Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildInputName(),
                _buildInputAccount(),
                _buildInputPassword(),
                _buildDescription(),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 0),
                    child: Text('保存'),
                    color: Colors.blue,
                    elevation: 5,
                    highlightElevation: 10,
                    onPressed: () {
                      var _form = _formKey.currentState;

                      if (_form.validate()) {
                        _form.save();
                        if (widget.type == Type.create) {
                          _service.addItem(widget.info);
                        } else {
                          _service.updateItem(widget.info);
                        }
                        Navigator.pop(context);
                      }
                    },
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );;
  }

  _buildInputName() {
    return new TextFormField(
      decoration: new InputDecoration(
          labelText: "名称",
          prefixIcon: Icon(Icons.person),
      ),
      initialValue: widget.info.name,
      onSaved: (val) {
        widget.info.name = val;
      },
      validator: (val) {
        return (val == null || val.length <= 0) ? '请输入名称' : null;
      },
    );
  }

  _buildInputAccount() {
    return new TextFormField(
      decoration: new InputDecoration(
          labelText: "账号",
          prefixIcon: Icon(Icons.account_box),
      ),
      initialValue: widget.info.account,
      onSaved: (val) {
          widget.info.account = val;
      },
      validator: (val) {
        return (val == null || val.length <= 0) ? '请输入账号' : null;
      },
    );
  }

  _buildInputPassword() {
    return new TextFormField(
      decoration: new InputDecoration(
        labelText: "密码",
        prefixIcon: Icon(Icons.lock),
      ),
      initialValue: widget.info.password,
      onSaved: (val) {
          widget.info.password = val;
      },
      obscureText: true,
      validator: (val) {
        return (val == null || val.length <= 0) ? '请输入密码' : null;
      },
    );
  }

  _buildDescription() {
    return new TextFormField(
          decoration: new InputDecoration(
            labelText: "描述",
            prefixIcon: Icon(Icons.description),
            hintText: '请输入描述',
          ),
          initialValue: widget.info.description,
          maxLines: 4,
          maxLength: 100,
          onSaved: (val) {
            widget.info.description = val;
          },
        );
  }

}
enum Type {
  update,
  create
}