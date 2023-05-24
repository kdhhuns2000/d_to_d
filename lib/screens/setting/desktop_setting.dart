import 'package:d_to_d/screens/setting/setting_icons.dart';
import 'package:flutter/material.dart';

class DesktopSetting extends StatefulWidget {
  const DesktopSetting({super.key});
  @override
  State<DesktopSetting> createState() => _DesktopSettingState();
}

class _DesktopSettingState extends State<DesktopSetting> {
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          right: mediaWidth * 0.05,
          left: mediaWidth * 0.05,
          top: mediaHeight * 0.05,
          bottom: mediaHeight * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, // 이미지 상단 정렬
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  '이한슬',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                subtitle: Text('하하하 개발자 - 이승민',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey)),
                                textColor: Colors.black,
                              ),
                              SizedBox(height: 20), // 가운데 간격

                              settingDivider(),
                              settingListTile("계정", SettingIcon.account),
                              settingDivider(),
                              settingListTile("알림설정", SettingIcon.bell),
                              settingDivider(),
                              settingListTile(
                                  "깃허브", SettingIcon.github_inverted),
                              settingDivider(),
                              settingListTile("좋아요", SettingIcon.thumbsup),
                              settingDivider(),
                              settingListTile("내 게시글", SettingIcon.preview),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: mediaWidth * 0.05), // 가운데 간격

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 27.0),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.asset(
                          'assets/images/img_setting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0), // 가운데 간격

          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}

Widget settingListTile(String title, IconData icon) {
  return ListTile(
    horizontalTitleGap: 0,
    title: Text(title, style: TextStyle(fontSize: 16.0)),
    leading: Icon(icon, size: 20.0),
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
