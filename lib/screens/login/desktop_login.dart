import 'package:d_to_d/widgets/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/login/desktop_login_button.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/bg_developer.jpg'),
                fit: BoxFit.cover,
              )),
              height: double.infinity,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text(
                  'Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontFamily: 'NotoSerifKR',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_designer.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Text(
                      'Designer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontFamily: 'NotoSerifKR',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DesktopLoginButton(location: 'Login'),
                      DesktopLoginButton(location: 'Sign in')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
