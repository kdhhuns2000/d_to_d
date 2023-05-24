import 'package:d_to_d/screens/setting/setting_icons.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/screens/setting/mobile_setting.dart';
import 'package:d_to_d/widgets/layout/desktop_layout.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/screens/setting/desktop_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ResponsiveLayout(
              mobileBody: MobileSetting(),
              // tabletBody: TabletLayout(
              //   child: child,
              // ),
              desktopBody: DesktopSetting(),
            ),
          ),
        ],
      ),
    );
  }
}
