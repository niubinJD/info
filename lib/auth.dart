import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'main_page.dart';
class Auth extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final LocalAuthentication auth = LocalAuthentication();
  /// 识别结果
  final iosStrings = const IOSAuthMessages(
      cancelButton: '取消',
      goToSettingsButton: '设置',
      goToSettingsDescription: '请设置Touch ID.',
      lockOut: '请启用Touch ID');
  final androidStrings = const AndroidAuthMessages(
      fingerprintNotRecognized: '验证失败',
      fingerprintSuccess: '验证成功',
      cancelButton: '取消',
      signInTitle: '指纹登陆',
      goToSettingsButton: '设置',
      goToSettingsDescription: '',
      fingerprintRequiredTitle: '指纹注册');


  void initAuth() async{
    _authenticate();
  }
  @override
  Widget build(BuildContext context) {
    initAuth();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset('images/fingerprint.png', width: 60, height: 60),
                  onTap: _authenticate,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('点击进行指纹解锁')
                )
              ],
            ),
          )
       ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<Null> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: '扫描指纹进行身份验证',
          useErrorDialogs: true,
          stickyAuth: true,
          androidAuthStrings: androidStrings,
          iOSAuthStrings: iosStrings);
      if (!authenticated) {
        return;
      }
      Navigator.pop(context);
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return new MainPage();
      }));
    } on PlatformException catch (e) {
      print(e);
    }
    if (mounted) {
      return;
    }

    // 跳转
  }
}