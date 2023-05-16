import 'package:d_to_d/screens/setting/setting_icons.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("이한슬"),
          subtitle: Text("대학생 디자이너"),
          textColor: Colors.black,
        ),
        settingDivider(),
        settingListTile("계정", SettingIcon.account),
        settingDivider(),
        settingListTile("알림설정", SettingIcon.bell),
        settingDivider(),
        settingListTile("깃허브", SettingIcon.github_inverted),
        settingDivider(),
        settingListTile("좋아요", SettingIcon.thumbsup),
        settingDivider(),
        settingListTile("내 게시글", SettingIcon.preview),
        Expanded(
          child: Image.asset('assets/images/img_setting.png',
              width: double.infinity, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

Widget settingListTile(String title, IconData icon) {
  return ListTile(
    horizontalTitleGap: 0,
    title: Text(title),
    leading: Icon(icon),
    textColor: Colors.black,
    iconColor: Colors.black,
  );
}

Widget settingDivider() {
  return Divider(
    height: 0.8,
    thickness: 0.8,
    color: Color.fromARGB(255, 213, 213, 213),
  );
}
