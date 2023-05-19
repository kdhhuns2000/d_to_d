import 'package:d_to_d/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/screens/login/desktop_login.dart';
import 'package:d_to_d/screens/login/mobile_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ResponsiveLayout(
              mobileBody: MobileLogin(),
              tabletBody: Container(),
              desktopBody: DesktopLogin(),
            ),
          ),
        ],
      ),
    );
  }
}
