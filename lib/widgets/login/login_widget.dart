import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d_to_d/utils/provider/login_modal_state_provider.dart';
import 'package:d_to_d/utils/api/service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWidget extends ConsumerStatefulWidget {
  const LoginWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   final login = ref.read(loginStateProvider);
  //   print(login);
  // }

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginValue = ref.watch(loginModalStateProvider);
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: mediaHeight * 0.15,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: mediaWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 1.5,
                color: Colors.white,
              ),
            ),
            child: ExpansionTile(
              title: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              expandedAlignment: Alignment.center,
              onExpansionChanged: (value) =>
                  ref.watch(loginModalStateProvider.notifier).update(),
              children: [
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    hintText: '아이디',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                TextField(
                  controller: _pwController,
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      _onLogin(_idController.text, _pwController.text),
                  child: Text('로그인'),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                loginValue == true ? '' : 'Sign in',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => {},
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onLogin(String id, String pw) async {
    await Service.login(id, pw).then((response) {
      if (response == 'Login Fail') {
        Fluttertoast.showToast(
          msg: '로그인 정보를 다시 확인해주세요',
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        context.go('/home');
      }
    });
  }
}
