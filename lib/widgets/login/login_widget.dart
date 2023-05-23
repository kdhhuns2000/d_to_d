import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider = StateProvider<bool>((ref) => false);

class LoginWidget extends ConsumerStatefulWidget {
  const LoginWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ConsumerState<LoginWidget> {
  @override
  void initState() {
    super.initState();
    final login = ref.read(loginStateProvider);
    print(login);
  }

  @override
  Widget build(BuildContext context) {
    final loginValue = ref.watch(loginStateProvider);
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => ref.read(loginStateProvider.notifier).state =
                  !ref.read(loginStateProvider.notifier).state,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                'Login$loginValue',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    context.go('/home');
  }
}
