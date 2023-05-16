import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _onLogin(),
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
                'Login',
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
