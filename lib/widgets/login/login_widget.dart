import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d_to_d/utils/provider/login_state_provider.dart';

// final loginStateProvider = StateProvider<bool>((ref) => false);

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

  @override
  Widget build(BuildContext context) {
    final loginValue = ref.watch(loginStateProvider);
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
                  ref.watch(loginStateProvider.notifier).update(),
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: '아이디',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onLogin(),
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

  void _onLogin() {
    context.go('/home');
  }
}
